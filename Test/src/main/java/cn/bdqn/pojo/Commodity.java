package cn.bdqn.pojo;

/**
 * ��Ʒ��
 * 
 * @author Administrator
 * 
 */
public class Commodity {
	private String commodityId; // ��Ʒ��� ����
	private String cName; // ��Ʒ����
	private int genreId; // ��Ʒ��� �����������
	private int unitId; // ��Ʒ��λ ���������λ��
	private int pigmentId; // ��ɫ���� ���������ɫ��
	private int dimensionId; // �ߴ��� ��������ߴ��
	private int brandId; // Ʒ��id �������Ʒ�Ʊ�
	private int condition; // ��Ʒ״̬ 1.���� 2.����
	private int minimum; // ��Ϳ��
	private int comments; // ��ע

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
