﻿using MinimalJwt.Models;

namespace MinimalJwt.Services
{
    public interface ICVService
    {
        public CV Create(CV cv);
        public CV Get(int id);
        public List<CV> List();
        public CV Update(CV cv);
        public bool Delete(int id);
    }
}
