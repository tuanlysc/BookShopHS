using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using QLHS.Models;
namespace QLHS.Areas.Admin.Controllers
{
    [Authorize]
    public class AuthorController : Controller
    {
        QLHS.Models.HieuSachEntities db = new QLHS.Models.HieuSachEntities();
        // GET: Admin/Category
        public ActionResult Index(int? page)
        {
            int pageSize = 4;
            int pageNumber = page ?? 1;
            List<author> data = db.authors.OrderByDescending((author n) => n.id).ToList();
            return View(data.ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(QLHS.Models.author obj)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var fImage = Request.Files["fImage"];
                    if (fImage != null && fImage.ContentLength > 0)
                    {
                        string fName = fImage.FileName;
                        string foder = Server.MapPath("~/Assets/Upload/" + fName);
                        fImage.SaveAs(foder);
                        obj.img =  fName;
                    }
                    db.authors.Add(obj);
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
            QLHS.Models.author existingcategory = db.authors.Find(id);

            if (existingcategory == null)
            {
                return HttpNotFound();
            }

            return View(existingcategory);
        }

        [HttpPost]
        public ActionResult Edit(QLHS.Models.author obj)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var fImage = Request.Files["fImage"];
                    if (fImage != null && fImage.ContentLength > 0)
                    {

                        string fName = fImage.FileName;
                        string folder = Server.MapPath("~/Assets/Upload/" + fName);
                        fImage.SaveAs(folder);
                        obj.img =  fName;
                    }

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
            QLHS.Models.author categoryToDelete = db.authors.Find(id);

            if (categoryToDelete == null)
            {
                return HttpNotFound();
            }

            db.authors.Remove(categoryToDelete);
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}