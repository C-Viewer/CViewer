﻿using CViewer.DataAccess.Entities;
using CViewer.Utils;
using System.Xml.Serialization;
using System.Xml;
using CViewer.Services;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace CViewer.DataAccess.DataManager
{
    // ToDo: Remove this bullshit. Need to add interface for data access.
    internal static class DataManager
    {
        internal const int EntityNotFound = -1;

        internal static void SetTokenToProfileBySignIn(int profileId, Token token)
        {
            ProfileToToken profileToToken = GetProfileAndToken(profileId);
            if (profileToToken == null)
            {
                AddProfileAndToken(profileId, token);
                return;
            }

            profileToToken.Token = token;
        }

        internal static void AddProfileAndToken(int profileId, Token token)
        {
            using CViewerMgrDbContext db = new();
            ProfileToToken profileToToken = new() { ProfileId = profileId, Token = token };
            db.ProfileToTokens.Add(profileToToken);
            db.Tokens.Add(token);
            db.SaveChangesAsync();
        }

        internal static ProfileToToken GetProfileAndToken(int profileId)
        {
            using CViewerMgrDbContext db = new();
            return db.ProfileToTokens.FirstOrDefault(p => p.ProfileId == profileId);
        }

        internal static ProfileToToken GetProfileAndToken(string applicantOrExpertTokenValue)
        {
            using CViewerMgrDbContext db = new();
            return db.ProfileToTokens.FirstOrDefault(p => p.Token != null && p.Token.Value.Equals(applicantOrExpertTokenValue));
        }

        internal static Profile GetProfile(string applicantOrExpertTokenValue)
        {
            using CViewerMgrDbContext db = new();
            ProfileToToken profileToToken = db.ProfileToTokens.FirstOrDefault(p =>
                    p.Token != null && p.Token.Value == applicantOrExpertTokenValue);
            if (profileToToken == null)
            {
                return null;
            }

            return GetProfile(profileToToken.ProfileId);
        }

        internal static Profile GetProfile(int profileId)
        {
            using CViewerMgrDbContext db = new();
            return db.Profiles.Where(u => u.Id == profileId).FirstOrDefault();
        }

        internal static Profile GetProfileFromMemory(string email, string password)
        {
            using CViewerMgrDbContext db = new();
            return db.Profiles.FirstOrDefault(u => u.EmailAddress.Equals(email) && u.Password.Equals(password));
        }

        internal static int GetProfilesCountFromMemory()
        {
            using CViewerMgrDbContext db = new();
            return db.Profiles.Count();
        }

        internal static void AddProfileToMemory(Profile profile)
        {
            using CViewerMgrDbContext db = new();
            db.Profiles.Add(profile);
            db.SaveChangesAsync();
        }

        internal static List<int> GetProfilesIdsForCv(int cvId)
        {
            using (CViewerMgrDbContext db = new())
            {
                Cv cv = db.Cvs.FirstOrDefault(cv => cv.Id == cvId);
                if (cv == null)
                {
                    return new List<int> { EntityNotFound };
                }

                List<int> peopleIds = new() { cv.PeopleCreatedId };
                List<int> expertsIds = cv.CvExperts.Select(cv => cv.Id).ToList();
                if (expertsIds != null && expertsIds.Any())
                {
                    peopleIds.AddRange(expertsIds);
                }

                return peopleIds;
            }
        }

        internal static List<CvHistory> GetCVHistories(int cvId)
        {
            using CViewerMgrDbContext db = new();
            return db.CvHistories.Where(h => h.CvId == cvId).OrderByDescending(el => el.DateTime).ToList();
        }

        internal static List<Cv> GetCvsForProfile(int profileId)
        {
            using CViewerMgrDbContext db = new();
            return db.Cvs.Where(cv => cv.PeopleCreatedId == profileId || (!cv.OpenToReview && cv.CvExperts.Select(cv => cv.Id) != null && cv.CvExperts.Select(cv => cv.Id).Contains(profileId))).ToList();
        }

        internal static Cv GetCv(int cvId)
        {
            using CViewerMgrDbContext db = new();
            return db.Cvs.FirstOrDefault(cv => cv.Id == cvId);
        }

        public static List<Cv> ListCVs()
        {
            using CViewerMgrDbContext db = new();
            return db.Cvs.ToList();
        }

        internal static int GetTokenCount()
        {
            using CViewerMgrDbContext db = new();
            return db.Tokens.Count();
        }

        internal static Status GetStatus(CVStatusType s)
        {
            using CViewerMgrDbContext db = new();
            return db.Statuses.Where(st => st.Name == s).FirstOrDefault();
        }

        internal static List<CVStatusType> GetCVStatuses()
        {
            return Enum.GetValues(typeof(CVStatusType)).Cast<CVStatusType>().ToList();
        }

        public static Profile GetExpertProfile(int expertId)
        {
            using CViewerMgrDbContext db = new();
            return db.Profiles.FirstOrDefault(p => p.Id == expertId && p.IsExpert);
        }

        public static Profile GetApplicantProfile(int applicantId)
        {
            using CViewerMgrDbContext db = new();
            return db.Profiles.FirstOrDefault(p => p.Id == applicantId && !p.IsExpert);
        }

        public static void RemoveProfileAndToken(string applicantOrExpertTokenValue)
        {
            using CViewerMgrDbContext db = new();
            ProfileToToken profileToToken = db.ProfileToTokens.FirstOrDefault(p => p.Token.Value == applicantOrExpertTokenValue);
            if (profileToToken != null)
            {
                db.ProfileToTokens.Remove(profileToToken);
            }
        }

        public static List<Specialization> ListSpecializations()
        {
            using CViewerMgrDbContext db = new();
            return db.Specializations.ToList();
        }

        public static int GetCVHistoriesCount()
        {
            using CViewerMgrDbContext db = new();
            return db.CvHistories.Count();
        }

        public static int GetCVCount()
        {
            using CViewerMgrDbContext db = new();
            return db.Cvs.Count();
        }

        public static Tag GetTag(int cvTag)
        {
            using CViewerMgrDbContext db = new();
            return db.Tags.Where(t => t.Id == cvTag).FirstOrDefault();
        }

        public static List<Tag> ListCVTags()
        {
            using CViewerMgrDbContext db = new();
            return db.Tags.ToList();
        }

        public static void AddCV(Cv newCV)
        {
            using CViewerMgrDbContext db = new();
            db.Cvs.Add(newCV);
            db.SaveChangesAsync();
        }

        public static void AddCVHistory(string fileName, string urlForDownload, int cvId, int authorId)
        {
            using CViewerMgrDbContext db = new();
            CvHistory cvHistory = new()
            {
                Id = GetCVHistoriesCount() + 1,
                FileName = fileName,
                AmazonPathToFile = urlForDownload,
                CvId = cvId,
                DateTime = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow),
                AuthorId = authorId,
            };

            db.CvHistories.Add(cvHistory);
            db.SaveChangesAsync();
        }

        public static void AddCVHistory(CvHistory cvEventForHistory)
        {
            using CViewerMgrDbContext db = new();
            db.CvHistories.Add(cvEventForHistory);
            db.SaveChangesAsync();
        }

        public static List<Cv> ListCvsOpenedForReview()
        {
            using CViewerMgrDbContext db = new();
            return db.Cvs.Where(cv => cv.OpenToReview).ToList();
        }

        public static void MakeCvAsGood(int cvId)
        {
            using (CViewerMgrDbContext db = new())
            {
                Cv cv = db.Cvs.FirstOrDefault(cv => cv.Id == cvId);
                cv.GoodCv = true;
                db.SaveChangesAsync();
            }
        }

        public static List<Cv> ListGoodCvs()
        {
            using CViewerMgrDbContext db = new();
            return db.Cvs.Where(cv => cv.GoodCv).OrderByDescending(cv => cv.Grade).ToList();
        }

        public static int GetReportsCount()
        {
            using CViewerMgrDbContext db = new();
            return db.Reports.Count();
        }

        public static void AddReport(string comment, int peopleId, int authorId, int mark)
        {
            using CViewerMgrDbContext db = new();
            Report report = new()
            {
                Id = GetReportsCount() + 1,
                Text = comment,
                ProfileId = peopleId,
                CreatedDate = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow),
                AuthorId = authorId,
                Rating = mark
            };

            db.Reports.Add(report);
            Profile profile = db.Profiles.Where(p => p.Id == peopleId).First();

            double marks = db.Reports.Where(r => r.ProfileId == peopleId).Select(r => r.Rating).Sum();
            double count = db.Reports.Where(r => r.ProfileId == peopleId).Count();
            profile.Rating = marks / count;
            db.SaveChangesAsync();
        }

        public static async Task<string> GenerateCViewerReportAsync(DateTime date, IAmazonS3Service amazonS3Service)
        {
            using CViewerMgrDbContext db = new();
            int allCv = db.Cvs.Where(cv => cv.DateCreation.Month == date.Month && cv.DateCreation.Year == date.Year).Count();
            int allCvFile = db.CvHistories.Where(cv => cv.DateTime.Month == date.Month && cv.DateTime.Year == date.Year && cv.AmazonPathToFile != null).Count();
            int allExpertReports = db.CvHistories.Where(cv => cv.DateTime.Month == date.Month && cv.DateTime.Year == date.Year && cv.Grade != null).Count();
            int allApplicantReports = db.Reports.Where(r => r.CreatedDate.Month == date.Month && r.CreatedDate.Year == date.Year).Count();
            int allMaxReports = db.CvHistories.Where(cv => cv.DateTime.Month == date.Month && cv.DateTime.Year == date.Year && cv.Grade == 5).Count() + db.Reports.Where(r => r.CreatedDate.Month == date.Month && r.CreatedDate.Year == date.Year && r.Rating == 5).Count();
            CviewerReport cviewerReport = new()
            {
                option0 = "Количество загруженных резюме за " + $"{date:Y}",
                option1 = "Количество загруженных файлов резюме за " + $"{date:Y}",
                option2 = "Количество оценок экспертами за " + $"{date:Y}",
                option3 = "Количество оценок пользователями за " + $"{date:Y}",
                option4 = "Количество оценок на максимальный балл за " + $"{date:Y}",
                property0 = allCv,
                property1 = allCvFile,
                property2 = allExpertReports,
                property3 = allApplicantReports,
                property4 = allMaxReports
            };

            XmlSerializer xsSubmit = new(typeof(CviewerReport));
            var xml = "";

            using (var sww = new StringWriter())
            {
                using XmlWriter writer = XmlWriter.Create(sww);
                xsSubmit.Serialize(writer, cviewerReport);
                xml = sww.ToString();
            }

            string path = "";
            using (var stream = WorkWithFiles.GenerateStreamFromString(xml))
            {
                string dateNow = WorkWithFiles.GetDateForName();
                path = "report_" + dateNow.Replace(' ', '_') + ".xml";
                await amazonS3Service.AddFileAsync(WorkWithFiles.ReturnFormFile(stream, path), path);
            }

            return amazonS3Service.GetAmazonFileURL(path);
        }
    }
}
