﻿// -----------------------------------------------------------------------
// <copyright file="MatterTag.cs" company="Nodine Legal, LLC">
// Licensed to Nodine Legal, LLC under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  Nodine Legal, LLC licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
// </copyright>
// -----------------------------------------------------------------------

namespace OpenLawOffice.Data.Matters
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Linq;
    using AutoMapper;
    using Dapper;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public static class MatterTag
    {
        public static Common.Models.Matters.MatterTag Get(Guid id)
        {
            Common.Models.Matters.MatterTag model =
                DataHelper.Get<Common.Models.Matters.MatterTag, DBOs.Matters.MatterTag>(
                "SELECT * FROM \"matter_tag\" WHERE \"id\"=@id AND \"utc_disabled\" is null",
                new { id = id });

            if (model == null) return null;

            if (model.TagCategory != null)
                model.TagCategory = Tagging.TagCategory.Get(model.TagCategory.Id);

            return model;
        }

        public static List<Common.Models.Matters.MatterTag> List()
        {
            return DataHelper.List<Common.Models.Matters.MatterTag, DBOs.Matters.MatterTag>(
                "SELECT * FROM \"matter_tag\" WHERE \"utc_disabled\" is null");
        }

        public static List<Common.Models.Matters.MatterTag> ListForMatter(Guid matterId)
        {
            List<Common.Models.Matters.MatterTag> list =
                DataHelper.List<Common.Models.Matters.MatterTag, DBOs.Matters.MatterTag>(
                "SELECT * FROM \"matter_tag\" WHERE \"matter_id\"=@MatterId AND \"utc_disabled\" is null",
                new { MatterId = matterId });

            list.ForEach(x =>
            {
                x.TagCategory = Tagging.TagCategory.Get(x.TagCategory.Id);
            });

            return list;
        }

        public static Common.Models.Matters.MatterTag Create(Common.Models.Matters.MatterTag model,
            Common.Models.Account.Users creator)
        {
            if (!model.Id.HasValue) model.Id = Guid.NewGuid();
            model.CreatedBy = model.ModifiedBy = creator;
            model.Created = model.Modified = DateTime.UtcNow;

            Common.Models.Tagging.TagCategory existingTagCat = Tagging.TagCategory.Get(model.TagCategory.Name);

            if (existingTagCat == null)
            {
                existingTagCat = Tagging.TagCategory.Create(model.TagCategory, creator);
            }

            model.TagCategory = existingTagCat;
            DBOs.Matters.MatterTag dbo = Mapper.Map<DBOs.Matters.MatterTag>(model);

            using (IDbConnection conn = Database.Instance.GetConnection())
            {
                conn.Execute("INSERT INTO \"matter_tag\" (\"id\", \"matter_id\", \"tag_category_id\", \"tag\", \"utc_created\", \"utc_modified\", \"created_by_user_pid\", \"modified_by_user_pid\") " +
                    "VALUES (@Id, @MatterId, @TagCategoryId, @Tag, @UtcCreated, @UtcModified, @CreatedByUserPId, @ModifiedByUserPId)",
                    dbo);
            }

            return model;
        }

        public static Common.Models.Matters.MatterTag Edit(Common.Models.Matters.MatterTag model,
            Common.Models.Account.Users modifier)
        {
            model.ModifiedBy = modifier;
            model.Modified = DateTime.UtcNow;
            DBOs.Matters.MatterTag dbo = Mapper.Map<DBOs.Matters.MatterTag>(model);

            using (IDbConnection conn = Database.Instance.GetConnection())
            {
                conn.Execute("UPDATE \"matter_tag\" SET " +
                    "\"matter_id\"=@MatterId, \"tag\"=@Tag, \"utc_modified\"=@UtcModified, \"modified_by_user_pid\"=@ModifiedByUserPId " +
                    "WHERE \"id\"=@Id", dbo);
            }

            model.TagCategory = UpdateTagCategory(model, modifier);

            return model;
        }

        private static Common.Models.Tagging.TagCategory UpdateTagCategory(
            Common.Models.Matters.MatterTag model,
            Common.Models.Account.Users modifier)
        {
            Common.Models.Matters.MatterTag currentTag = Get(model.Id.Value);

            if (currentTag.TagCategory != null)
            {
                if (model.TagCategory != null && !string.IsNullOrEmpty(model.TagCategory.Name))
                { // If current has tag & new has tag
                    // Are they the same - ignore if so
                    if (currentTag.Tag != model.Tag)
                    {
                        // Update - change tagcat
                        model.TagCategory = AddOrChangeTagCategory(model, modifier);
                    }
                }
                else
                {
                    // If current has tag & new !has tag
                    // Update - drop tagcat
                    currentTag.TagCategory = null;

                    using (IDbConnection conn = Database.Instance.GetConnection())
                    {
                        conn.Execute("UPDATE \"matter_tag\" SET \"tag_category_id\"=null WHERE \"id\"=@Id",
                            new { Id = model.Id.Value });
                    }
                }
            }
            else
            {
                if (model.TagCategory != null && !string.IsNullOrEmpty(model.TagCategory.Name))
                { // If current !has tag & new has tag
                    // Update - add tagcat
                    model.TagCategory = AddOrChangeTagCategory(model, modifier);
                }

                // If current !has tag & new !has tag - do nothing
            }

            return model.TagCategory;
        }

        private static Common.Models.Tagging.TagCategory AddOrChangeTagCategory(
            Common.Models.Matters.MatterTag tag,
            Common.Models.Account.Users modifier)
        {
            Common.Models.Tagging.TagCategory newTagCat = null;

            // Check for existing name
            if (tag.TagCategory != null && !string.IsNullOrEmpty(tag.TagCategory.Name))
            {
                newTagCat = Tagging.TagCategory.Get(tag.TagCategory.Name);
            }

            // Either need to use existing or create a new tag category
            if (newTagCat != null)
            {
                // Can use existing
                tag.TagCategory = newTagCat;

                // If new tagcat was disabled, it needs enabled
                if (newTagCat.Disabled.HasValue)
                {
                    tag.TagCategory = Tagging.TagCategory.Enable(tag.TagCategory, modifier);
                }
            }
            else
            {
                // Add one
                tag.TagCategory = Tagging.TagCategory.Create(tag.TagCategory, modifier);
            }

            // Update MatterTag's TagCategoryId
            using (IDbConnection conn = Database.Instance.GetConnection())
            {
                conn.Execute("UPDATE \"matter_tag\" SET \"tag_category_id\"=@TagCategoryId WHERE \"id\"=@Id",
                    new { Id = tag.Id.Value, TagCategoryId = tag.TagCategory.Id });
            }

            return tag.TagCategory;
        }

        public static Common.Models.Matters.MatterTag Disable(Common.Models.Matters.MatterTag model,
            Common.Models.Account.Users disabler)
        {
            model.DisabledBy = disabler;
            model.Disabled = DateTime.UtcNow;

            DataHelper.Disable<Common.Models.Matters.MatterTag,
                DBOs.Matters.MatterTag>("matter_tag", disabler.PId.Value, model.Id);

            return model;
        }

        public static Common.Models.Matters.MatterTag Enable(Common.Models.Matters.MatterTag model,
            Common.Models.Account.Users enabler)
        {
            model.ModifiedBy = enabler;
            model.Modified = DateTime.UtcNow;
            model.DisabledBy = null;
            model.Disabled = null;

            DataHelper.Enable<Common.Models.Matters.MatterTag,
                DBOs.Matters.MatterTag>("matter_tag", enabler.PId.Value, model.Id);

            return model;
        }

        public static List<Common.Models.Matters.MatterTag> Search(string text)
        {
            List<Common.Models.Matters.MatterTag> list = new List<Common.Models.Matters.MatterTag>();
            List<DBOs.Matters.MatterTag> dbo = null;

            using (IDbConnection conn = Database.Instance.GetConnection())
            {
                dbo = conn.Query<DBOs.Matters.MatterTag>(
                    "SELECT * FROM \"matter_tag\" WHERE LOWER(\"tag\") LIKE '%' || @Query || '%'",
                    new { Query = text }).ToList();
            }

            dbo.ForEach(x =>
            {
                Common.Models.Matters.MatterTag mt = Mapper.Map<Common.Models.Matters.MatterTag>(x);
                mt.TagCategory = Tagging.TagCategory.Get(mt.TagCategory.Id);
                mt.Matter = Matter.Get(mt.Matter.Id.Value);
                list.Add(mt);
            });

            return list;
        }
    }
}