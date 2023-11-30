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
    public class WarehouseController : Controller
    {
        Models.HieuSachEntities db = new Models.HieuSachEntities();
        // GET: Admin/Warehouse
        public ActionResult Index(int? page)
        {
            int pageSize = 2;
            int pageNumber = page ?? 1;
            List<Models.warehouse> data = db.warehouses.ToList();

            return View(data.ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(Models.warehouse obj)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    
                    db.warehouses.Add(obj);
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
            Models.warehouse existingwarehouse = db.warehouses.Find(id);

            if (existingwarehouse == null)
            {
                return HttpNotFound();
            }

            return View(existingwarehouse);
        }

        [HttpPost]
        public ActionResult Edit(Models.warehouse obj)
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
            Models.warehouse warehouseToDelete = db.warehouses.Find(id);

            if (warehouseToDelete == null)
            {
                return HttpNotFound();
            }

            return View(warehouseToDelete);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Models.warehouse warehouseToDelete = db.warehouses.Find(id);

            if (warehouseToDelete == null)
            {
                return HttpNotFound();
            }

            db.warehouses.Remove(warehouseToDelete);
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}