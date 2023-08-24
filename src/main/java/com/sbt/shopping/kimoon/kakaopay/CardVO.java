package com.sbt.shopping.kimoon.kakaopay;

public class CardVO {

    private String purchase_corp, purchase_corp_code;
    private String issuer_corp, issuer_corp_code;
    private String bin, card_type, install_month, approved_id, card_mid;
    private String interest_free_install, card_item_code;
    
    public CardVO() {
		// TODO Auto-generated constructor stub
	}

	public CardVO(String purchase_corp, String purchase_corp_code, String issuer_corp, String issuer_corp_code,
			String bin, String card_type, String install_month, String approved_id, String card_mid,
			String interest_free_install, String card_item_code) {
		super();
		this.purchase_corp = purchase_corp;
		this.purchase_corp_code = purchase_corp_code;
		this.issuer_corp = issuer_corp;
		this.issuer_corp_code = issuer_corp_code;
		this.bin = bin;
		this.card_type = card_type;
		this.install_month = install_month;
		this.approved_id = approved_id;
		this.card_mid = card_mid;
		this.interest_free_install = interest_free_install;
		this.card_item_code = card_item_code;
	}

	public String getPurchase_corp() {
		return purchase_corp;
	}

	public void setPurchase_corp(String purchase_corp) {
		this.purchase_corp = purchase_corp;
	}

	public String getPurchase_corp_code() {
		return purchase_corp_code;
	}

	public void setPurchase_corp_code(String purchase_corp_code) {
		this.purchase_corp_code = purchase_corp_code;
	}

	public String getIssuer_corp() {
		return issuer_corp;
	}

	public void setIssuer_corp(String issuer_corp) {
		this.issuer_corp = issuer_corp;
	}

	public String getIssuer_corp_code() {
		return issuer_corp_code;
	}

	public void setIssuer_corp_code(String issuer_corp_code) {
		this.issuer_corp_code = issuer_corp_code;
	}

	public String getBin() {
		return bin;
	}

	public void setBin(String bin) {
		this.bin = bin;
	}

	public String getCard_type() {
		return card_type;
	}

	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}

	public String getInstall_month() {
		return install_month;
	}

	public void setInstall_month(String install_month) {
		this.install_month = install_month;
	}

	public String getApproved_id() {
		return approved_id;
	}

	public void setApproved_id(String approved_id) {
		this.approved_id = approved_id;
	}

	public String getCard_mid() {
		return card_mid;
	}

	public void setCard_mid(String card_mid) {
		this.card_mid = card_mid;
	}

	public String getInterest_free_install() {
		return interest_free_install;
	}

	public void setInterest_free_install(String interest_free_install) {
		this.interest_free_install = interest_free_install;
	}

	public String getCard_item_code() {
		return card_item_code;
	}

	public void setCard_item_code(String card_item_code) {
		this.card_item_code = card_item_code;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((approved_id == null) ? 0 : approved_id.hashCode());
		result = prime * result + ((bin == null) ? 0 : bin.hashCode());
		result = prime * result + ((card_item_code == null) ? 0 : card_item_code.hashCode());
		result = prime * result + ((card_mid == null) ? 0 : card_mid.hashCode());
		result = prime * result + ((card_type == null) ? 0 : card_type.hashCode());
		result = prime * result + ((install_month == null) ? 0 : install_month.hashCode());
		result = prime * result + ((interest_free_install == null) ? 0 : interest_free_install.hashCode());
		result = prime * result + ((issuer_corp == null) ? 0 : issuer_corp.hashCode());
		result = prime * result + ((issuer_corp_code == null) ? 0 : issuer_corp_code.hashCode());
		result = prime * result + ((purchase_corp == null) ? 0 : purchase_corp.hashCode());
		result = prime * result + ((purchase_corp_code == null) ? 0 : purchase_corp_code.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CardVO other = (CardVO) obj;
		if (approved_id == null) {
			if (other.approved_id != null)
				return false;
		} else if (!approved_id.equals(other.approved_id))
			return false;
		if (bin == null) {
			if (other.bin != null)
				return false;
		} else if (!bin.equals(other.bin))
			return false;
		if (card_item_code == null) {
			if (other.card_item_code != null)
				return false;
		} else if (!card_item_code.equals(other.card_item_code))
			return false;
		if (card_mid == null) {
			if (other.card_mid != null)
				return false;
		} else if (!card_mid.equals(other.card_mid))
			return false;
		if (card_type == null) {
			if (other.card_type != null)
				return false;
		} else if (!card_type.equals(other.card_type))
			return false;
		if (install_month == null) {
			if (other.install_month != null)
				return false;
		} else if (!install_month.equals(other.install_month))
			return false;
		if (interest_free_install == null) {
			if (other.interest_free_install != null)
				return false;
		} else if (!interest_free_install.equals(other.interest_free_install))
			return false;
		if (issuer_corp == null) {
			if (other.issuer_corp != null)
				return false;
		} else if (!issuer_corp.equals(other.issuer_corp))
			return false;
		if (issuer_corp_code == null) {
			if (other.issuer_corp_code != null)
				return false;
		} else if (!issuer_corp_code.equals(other.issuer_corp_code))
			return false;
		if (purchase_corp == null) {
			if (other.purchase_corp != null)
				return false;
		} else if (!purchase_corp.equals(other.purchase_corp))
			return false;
		if (purchase_corp_code == null) {
			if (other.purchase_corp_code != null)
				return false;
		} else if (!purchase_corp_code.equals(other.purchase_corp_code))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CardVO [purchase_corp=" + purchase_corp + ", purchase_corp_code=" + purchase_corp_code
				+ ", issuer_corp=" + issuer_corp + ", issuer_corp_code=" + issuer_corp_code + ", bin=" + bin
				+ ", card_type=" + card_type + ", install_month=" + install_month + ", approved_id=" + approved_id
				+ ", card_mid=" + card_mid + ", interest_free_install=" + interest_free_install + ", card_item_code="
				+ card_item_code + "]";
	}
    
    
	
}
