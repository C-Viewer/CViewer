using MinimalJwt.Models;
using MinimalJwt.Repositories;

namespace MinimalJwt.Services
{
    public class CVService : ICVService
    {
        public CV Create(CV cv)
        {
            cv.Id = CVRepository.CVs.Count + 1;
            CVRepository.CVs.Add(cv);

            return cv;
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

            oldMovie.Name = newCv.Name;
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
