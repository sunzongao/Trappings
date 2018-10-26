package cn.bdqn.controller;

import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.stat.TableStat.Mode;
import com.sun.xml.internal.rngom.parse.Parseable;

import cn.bdqn.pojo.Detailed;
import cn.bdqn.service.DetailedService;
import cn.bdqn.util.JSONUtils;

@Controller
public class DetailedController {

	@Autowired
	private DetailedService detailedService;

	/**
	 * 添加商品到采购表单
	 * 
	 * @param procurementId
	 * @param commodityId
	 * @param number
	 * @param price
	 * @return
	 */
	@RequestMapping(value = "/jsp/dateiled_add.html", produces = "text/html;charset=UTF-8;")
	@ResponseBody
	private String addDateiled(String procurementId, String commodityId, String number, String price, Model model) {
		String[] split1 = number.split(",");
		String[] split2 = price.split(",");
		String[] split = commodityId.split(",");
		// 进行批量添加
		for (int i = 0; i < split.length && i < split1.length && i < split2.length; i++) {
			detailedService.addDetailed(procurementId, split[i], Integer.parseInt(split1[i]),
					Double.parseDouble(split2[i]));
		}
		// 查询数据
		List<Detailed> detaileds = detailedService.query(procurementId);
		String json = JSONUtils.beanToJson(detaileds);
		return json;
	}
	
	
	
	/**
	 * 批量删除
	 */
	@RequestMapping("/jsp/dateiled_del.html")
	@ResponseBody
	public String deleteitem(String id) {
		String[] split = id.split(",");
		String a = "";
		for (int i = 0; i < split.length; i++) {
			if (detailedService.deleteDetailed(Integer.parseInt(split[i])) > 0) {
				a = "true";
			} else {
				a = "false";
			}
		}
		return a;
	}

}
