package cn.bdqn.pojo;


import java.util.List;

import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;

/**
 * ��Ʒ��
 * @author GCL105659
 *
 */
public class Commodity {
	//��Ʒ���
	private String commodityId;
	//��Ʒ����
	private String cName;
	//��Ʒ���
	private int genreId;
	private Genre genre;
	//��Ʒ��λ
	private int unitId;
	private Unit unit;
	//��Ʒ��ɫ
	private int pigmentId;
	private Pigment pigment;
	//��Ʒ�ߴ�
	private int dimensionId;
	private Dimension dimension;
	//��ƷƷ��
	private int brandId;
	private Brand brand;
	//��ע
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
