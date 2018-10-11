package cn.bdqn.pojo;

/**
 * ����
 * 
 * @author Administrator
 * 
 */
public class Repertory {
	private String commodityId; // ��Ʒ��� ���������Ʒ��
	private String cName; // ��Ʒ����
	private int inventory; // �����
	private double avgPrice; // �ɱ���
	private double totalPrice; // �ɱ���ֵ
	private double pretium; // ���ۼ�
	private double totalCost; // �ܼ�ֵ
	private int unitId; // ��λid ���������λ��
	private int brandId; // Ʒ�Ʊ�� �������Ʒ�Ʊ�
	private String supplierId; // ��Ӧ�̱�� ���������Ӧ�̱�
	private String laidTime; // ���ʱ��
	private int storehouseId; // �����ֿ�Id ��������ֿ��
	private String repertoryUName; //��λName���Զ��壩
	private String repertoryBName;  //Ʒ��Name���Զ��壩
	private String repertorySeName;  //�����ֿ�Name(�Զ���)
	private String repertorySName;	//��Ӧ��(�Զ���)
	
	
	public String getRepertorySName() {
		return repertorySName;
	}

	public void setRepertorySName(String repertorySName) {
		this.repertorySName = repertorySName;
	}

	public String getRepertoryUName() {
		return repertoryUName;
	}

	public void setRepertoryUName(String repertoryUName) {
		this.repertoryUName = repertoryUName;
	}

	public String getRepertoryBName() {
		return repertoryBName;
	}

	public void setRepertoryBName(String repertoryBName) {
		this.repertoryBName = repertoryBName;
	}

	public String getRepertorySeName() {
		return repertorySeName;
	}

	public void setRepertorySeName(String repertorySeName) {
		this.repertorySeName = repertorySeName;
	}

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

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public double getAvgPrice() {
		return avgPrice;
	}

	public void setAvgPrice(double avgPrice) {
		this.avgPrice = avgPrice;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public double getPretium() {
		return pretium;
	}

	public void setPretium(double pretium) {
		this.pretium = pretium;
	}

	public double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}

	public int getUnitId() {
		return unitId;
	}

	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getLaidTime() {
		return laidTime;
	}

	public void setLaidTime(String laidTime) {
		this.laidTime = laidTime;
	}

	public int getStorehouseId() {
		return storehouseId;
	}

	public void setStorehouseId(int storehouseId) {
		this.storehouseId = storehouseId;
	}

	public Repertory(String commodityId, String cName, int inventory, double avgPrice, double totalPrice,
			double pretium, double totalCost, int unitId, int brandId, String supplierId, String laidTime,
			int storehouseId, String repertoryUName, String repertoryBName, String repertorySeName,
			String repertorySName) {
		super();
		this.commodityId = commodityId;
		this.cName = cName;
		this.inventory = inventory;
		this.avgPrice = avgPrice;
		this.totalPrice = totalPrice;
		this.pretium = pretium;
		this.totalCost = totalCost;
		this.unitId = unitId;
		this.brandId = brandId;
		this.supplierId = supplierId;
		this.laidTime = laidTime;
		this.storehouseId = storehouseId;
		this.repertoryUName = repertoryUName;
		this.repertoryBName = repertoryBName;
		this.repertorySeName = repertorySeName;
		this.repertorySName = repertorySName;
	}

	public Repertory() {
		super();
		// TODO Auto-generated constructor stub
	}

}
