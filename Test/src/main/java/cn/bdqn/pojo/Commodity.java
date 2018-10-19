package cn.bdqn.pojo;


import java.util.List;

import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;

/**
 * 商品表
 * @author GCL105659
 *
 */
public class Commodity {
	//商品编号
	private String commodityId;
	//商品名称
	private String cName;
	//商品类别
	private int genreId;
	private Genre genre;
	//商品单位
	private int unitId;
	private Unit unit;
	//商品颜色
	private int pigmentId;
	private Pigment pigment;
	//商品尺寸
	private int dimensionId;
	private Dimension dimension;
	//商品品牌
	private int brandId;
	private Brand brand;
	//备注
	private String comments;
	
	
	public String getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getGenreId() {
		return genreId;
	}
	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}
	public Genre getGenre() {
		return genre;
	}
	public void setGenre(Genre genre) {
		this.genre = genre;
	}
	public int getUnitId() {
		return unitId;
	}
	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}
	public Unit getUnit() {
		return unit;
	}
	public void setUnit(Unit unit) {
		this.unit = unit;
	}
	public int getPigmentId() {
		return pigmentId;
	}
	public void setPigmentId(int pigmentId) {
		this.pigmentId = pigmentId;
	}
	public Pigment getPigment() {
		return pigment;
	}
	public void setPigment(Pigment pigment) {
		this.pigment = pigment;
	}
	public int getDimensionId() {
		return dimensionId;
	}
	public void setDimensionId(int dimensionId) {
		this.dimensionId = dimensionId;
	}
	public Dimension getDimension() {
		return dimension;
	}
	public void setDimension(Dimension dimension) {
		this.dimension = dimension;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}

}
