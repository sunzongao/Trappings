package cn.bdqn.pojo;

/**
 * 商品表
 * 
 * @author Administrator
 * 
 */
public class Commodity {
	private String commodityId; // 商品编号 主键
	private String cName; // 商品名称
	private int genreId; // 商品类别 外键关联类别表
	private int unitId; // 商品单位 外键关联单位表
	private int pigmentId; // 颜色编码 外键关联颜色表
	private int dimensionId; // 尺寸编号 外键关联尺寸表
	private int brandId; // 品牌id 外键关联品牌表
	private int condition; // 商品状态 1.禁用 2.正常
	private int minimum; // 最低库存
	private int comments; // 备注

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

	public int getUnitId() {
		return unitId;
	}

	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}

	public int getPigmentId() {
		return pigmentId;
	}

	public void setPigmentId(int pigmentId) {
		this.pigmentId = pigmentId;
	}

	public int getDimensionId() {
		return dimensionId;
	}

	public void setDimensionId(int dimensionId) {
		this.dimensionId = dimensionId;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public int getCondition() {
		return condition;
	}

	public void setCondition(int condition) {
		this.condition = condition;
	}

	public int getMinimum() {
		return minimum;
	}

	public void setMinimum(int minimum) {
		this.minimum = minimum;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	public Commodity(String commodityId, String cName, int genreId, int unitId,
			int pigmentId, int dimensionId, int brandId, int condition,
			int minimum, int comments) {
		super();
		this.commodityId = commodityId;
		this.cName = cName;
		this.genreId = genreId;
		this.unitId = unitId;
		this.pigmentId = pigmentId;
		this.dimensionId = dimensionId;
		this.brandId = brandId;
		this.condition = condition;
		this.minimum = minimum;
		this.comments = comments;
	}

	public Commodity() {
		super();
		// TODO Auto-generated constructor stub
	}

}
