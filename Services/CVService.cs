using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;

namespace CViewer.Services
{
    public class CVService : ICVService
    {
        public CV CreateCVDraft(CV cv, int applicantId)
        {
            cv.Id = CVRepository.CVs.Count + 1;
            CVRepository.CVs.Add(cv);

            return cv;
        }

        public CV UpdateCVInfo(int cvId, string title = null, Specialization? specialization = null, List<CVTag> tags = null, string description = null)
        {
            var cvForUpdating = CVRepository.CVs.FirstOrDefault(o => o.Id == cvId);

            if (cvForUpdating is null) return null;

            if (title != null)
            {
                cvForUpdating.Title = title;
            }

            if (specialization != null)
            {
                cvForUpdating.Specialization = (Specialization)specialization;
            }

            if (tags != null)
            {
                cvForUpdating.Tags = tags;
            }

            if (description != null)
            {
                cvForUpdating.Description = description;
            }

            return cvForUpdating;
        }

        public CV Get(int id)
        {
            var movie = CVRepository.CVs.FirstOrDefault(o => o.Id == id);

            if (movie is null) return null;

            return movie;
        }

        public List<CV> List()
        {
            var movies = CVRepository.CVs;

            return movies;
        }

        public CV Update(CV newCv)
        {
            var oldMovie = CVRepository.CVs.FirstOrDefault(o => o.Id == newCv.Id);

            if (oldMovie is null) return null;

            oldMovie.Title = newCv.Title;
            oldMovie.Description = newCv.Description;
            oldMovie.Rating = newCv.Rating;

            return newCv;
        }

        public bool Delete(int id)
        {
            var oldMovie = CVRepository.CVs.FirstOrDefault(o => o.Id == id);

            if (oldMovie is null) return false;

            CVRepository.CVs.Remove(oldMovie);

            return true;
        }
    }
}
