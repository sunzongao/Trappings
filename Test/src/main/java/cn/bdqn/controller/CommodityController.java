package cn.bdqn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.pojo.Brand;
import cn.bdqn.pojo.Commodity;
import cn.bdqn.pojo.Dimension;
import cn.bdqn.pojo.Genre;
import cn.bdqn.pojo.Pigment;
import cn.bdqn.pojo.Procurement;
import cn.bdqn.pojo.Supplier;
import cn.bdqn.pojo.Unit;
import cn.bdqn.service.BrandService;
import cn.bdqn.service.CommodityService;
import cn.bdqn.service.DimensionService;
import cn.bdqn.service.GenreService;
import cn.bdqn.service.PigmentService;
import cn.bdqn.service.SupplierService;
import cn.bdqn.service.UnitService;
import cn.bdqn.util.PageUtil;

/**
 * 商品管理控制层
 * @author GCL105659
 *
 */

@Controller
public class CommodityController {
	
	@Autowired
	private CommodityService commodityService;
	@Autowired
	private GenreService genreService;
	@Autowired
	private UnitService unitService;
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private PigmentService pigmentService;
	@Autowired
	private DimensionService dimensionService;
	
	/**
	 * 显示商品信息
	 * @param pageindex
	 * @param commodityId
	 * @param genreId
	 * @param unitId
	 * @param supplierId
	 * @param brandId
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/commodity_list.html")
	public String commodity_list(String pageindex,String commodityId, Integer genreId, Integer unitId,
			String  supplierId, Integer brandId,Model model) {
		int temp=1;
		if(pageindex!=null) {
			temp=Integer.parseInt(pageindex);
		}
		PageUtil<Commodity> pageUtil = commodityService.queryCommodity(commodityId,genreId,unitId,supplierId,brandId,temp);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("commodityId",commodityId);
		model.addAttribute("unitId",unitId);
		model.addAttribute("supplierId",supplierId);
		model.addAttribute("brandId",brandId);
		model.addAttribute("genreId",genreId);
		List<Genre> genres=genreService.queryGenre();
		List<Unit> units=unitService.queryUnit();
		List<Supplier> suppliers=supplierService.querySuppliers();
		List<Brand> brands=brandService.queryBrand();
		model.addAttribute("genres",genres);
		model.addAttribute("units",units);
		model.addAttribute("suppliers",suppliers);
		model.addAttribute("brands",brands);
		return "commodity_list";
	}
	
	
	
	/**
	 * 显示商品详细信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/commodity_show.html")
	public String commodityShow(String id,Model model) {
		id=id.substring(12, id.length());
		System.out.println(id);
		Commodity commodity=commodityService.getCommodityById(id);
		model.addAttribute("commodity",commodity);
		return "commodity_show";
	}
	
	
	/**
	 * 进入修改页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/commodity_toupdate.html")
	public String commodityToUpdate(String id,Model model) {
		Commodity commodity=commodityService.getCommodityById(id);
		model.addAttribute("commodity",commodity);
		
		List<Genre> genres=genreService.queryGenre();
		List<Unit> units=unitService.queryUnit();
		List<Supplier> suppliers=supplierService.querySuppliers();
		List<Brand> brands=brandService.queryBrand();
		List<Pigment> pigments=pigmentService.queryPigment();
		List<Dimension> dimensions=dimensionService.queryDimension();
		model.addAttribute("pigments",pigments);
		model.addAttribute("dimensions",dimensions);
		model.addAttribute("genres",genres);
		model.addAttribute("units",units);
		model.addAttribute("suppliers",suppliers);
		model.addAttribute("brands",brands);
		return "commodity_update";
	}
	
	/**
	 * 修改商品
	 * @param employee
	 * @return
	 */
	@RequestMapping("/jsp/commodity_doupdate.html")
	@ResponseBody
	public String commodityDoUpdate(Commodity c) {
		if(commodityService.updateCommodity(c)>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	
	/**
	 * 删除商品
	 * @param supplierId
	 * @return
	 */
	@RequestMapping("/jsp/commodity_delete.html")
	@ResponseBody
	public String deleteCommodity(String commodityId) {
		if (commodityService.deleteCommodity(commodityId)>0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping("/jsp/commodity_todelete.html")
	@ResponseBody
	public String deleteitem(String id) {
		String[] split = id.split(",");
		String a = "";
		for (int i = 0; i < split.length; i++) {
			if (commodityService.deleteCommodity(split[i])> 0) {
				a = "true";
			} else {
				a = "false";
			}
		}
		return a;
	}
	
	
	/**
	 * 添加商品页面
	 * @return
	 */
	@RequestMapping("/jsp/commodity_toadd.html")
	public String toAddCommodity(Model model) {
		List<Genre> genres=genreService.queryGenre();
		List<Unit> units=unitService.queryUnit();
		List<Supplier> suppliers=supplierService.querySuppliers();
		List<Brand> brands=brandService.queryBrand();
		List<Pigment> pigments=pigmentService.queryPigment();
		List<Dimension> dimensions=dimensionService.queryDimension();
		model.addAttribute("pigments",pigments);
		model.addAttribute("dimensions",dimensions);
		model.addAttribute("genres",genres);
		model.addAttribute("units",units);
		model.addAttribute("suppliers",suppliers);
		model.addAttribute("brands",brands);
		return "commodity_add";
	}
	
	/**
	 * 添加商品
	 * @param commodity
	 * @return
	 */
	@RequestMapping("/jsp/commodity_doadd.html")
	@ResponseBody
	public String doAddCommodity(Commodity c) {
		if(commodityService.addCommodity(c)>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
}
