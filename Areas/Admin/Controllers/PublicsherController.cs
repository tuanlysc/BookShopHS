using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace QLHS.Areas.Admin.Controllers
{
    [Authorize]
    public class PublicsherController : Controller
    {
        QLHS.Models.HieuSachEntities db = new QLHS.Models.HieuSachEntities();
        // GET: Admin/Category
        public ActionResult Index(int? page)
        {
            int pageSize = 5;
            int pageNumber = page ?? 1;
            List<Models.publicsher> data = db.publicshers.ToList();
            return View(data.ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(QLHS.Models.publicsher obj)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    
                    db.publicshers.Add(obj);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                catch { }
            }

            return View(obj);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            QLHS.Models.publicsher existingcategory = db.publicshers.Find(id);

            if (existingcategory == null)
            {
                return HttpNotFound();
            }

            return View(existingcategory);
        }

        [HttpPost]
        public ActionResult Edit(QLHS.Models.publicsher obj)
        {
            if (ModelState.IsValid)
            {
                try
                {
                   

                    db.Entry(obj).State = EntityState.Modified;
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
                catch
                {
                    // Handle exceptions
                }
            }


            return View(obj);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            QLHS.Models.publicsher a = db.publicshers.Find(id);

            if (a == null)
            {
                return HttpNotFound();
            }

            db.publicshers.Remove(a);
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}