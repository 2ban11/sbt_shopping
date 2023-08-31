package com.sbt.shopping.kimoon.kakaopay;

import java.util.Date;

public class KakaoPayApprovalVO {
	
	//response
    private String aid, tid, cid, sid;
    private String partner_order_id, partner_user_id, payment_method_type;
    private AmountVO amount;
    private CardVO card_info;
    private String item_name, item_code, payload;
    private Integer quantity;
    private Date created_at, approved_at;
    
    public KakaoPayApprovalVO() {
		// TODO Auto-generated constructor stub
	}
    
	public KakaoPayApprovalVO(String aid, String tid, String cid, String sid, String partner_order_id,
			String partner_user_id, String payment_method_type, AmountVO amount, CardVO card_info, String item_name,
			String item_code, String payload, Integer quantity,
			Date created_at, Date approved_at) {
		super();
		this.aid = aid;
		this.tid = tid;
		this.cid = cid;
		this.sid = sid;
		this.partner_order_id = partner_order_id;
		this.partner_user_id = partner_user_id;
		this.payment_method_type = payment_method_type;
		this.amount = amount;
		this.card_info = card_info;
		this.item_name = item_name;
		this.item_code = item_code;
		this.payload = payload;
		this.quantity = quantity;
		this.created_at = created_at;
		this.approved_at = approved_at;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getPayment_method_type() {
		return payment_method_type;
	}
	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}
	public AmountVO getAmount() {
		return amount;
	}
	public void setAmount(AmountVO amount) {
		this.amount = amount;
	}
	public CardVO getCard_info() {
		return card_info;
	}
	public void setCard_info(CardVO card_info) {
		this.card_info = card_info;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getPayload() {
		return payload;
	}
	public void setPayload(String payload) {
		this.payload = payload;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((aid == null) ? 0 : aid.hashCode());
		result = prime * result + ((amount == null) ? 0 : amount.hashCode());
		result = prime * result + ((approved_at == null) ? 0 : approved_at.hashCode());
		result = prime * result + ((card_info == null) ? 0 : card_info.hashCode());
		result = prime * result + ((cid == null) ? 0 : cid.hashCode());
		result = prime * result + ((created_at == null) ? 0 : created_at.hashCode());
		result = prime * result + ((item_code == null) ? 0 : item_code.hashCode());
		result = prime * result + ((item_name == null) ? 0 : item_name.hashCode());
		result = prime * result + ((partner_order_id == null) ? 0 : partner_order_id.hashCode());
		result = prime * result + ((partner_user_id == null) ? 0 : partner_user_id.hashCode());
		result = prime * result + ((payload == null) ? 0 : payload.hashCode());
		result = prime * result + ((payment_method_type == null) ? 0 : payment_method_type.hashCode());
		result = prime * result + ((quantity == null) ? 0 : quantity.hashCode());
		result = prime * result + ((sid == null) ? 0 : sid.hashCode());
		result = prime * result + ((tid == null) ? 0 : tid.hashCode());
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
		KakaoPayApprovalVO other = (KakaoPayApprovalVO) obj;
		if (aid == null) {
			if (other.aid != null)
				return false;
		} else if (!aid.equals(other.aid))
			return false;
		if (amount == null) {
			if (other.amount != null)
				return false;
		} else if (!amount.equals(other.amount))
			return false;
		if (approved_at == null) {
			if (other.approved_at != null)
				return false;
		} else if (!approved_at.equals(other.approved_at))
			return false;
		if (card_info == null) {
			if (other.card_info != null)
				return false;
		} else if (!card_info.equals(other.card_info))
			return false;
		if (cid == null) {
			if (other.cid != null)
				return false;
		} else if (!cid.equals(other.cid))
			return false;
		if (created_at == null) {
			if (other.created_at != null)
				return false;
		} else if (!created_at.equals(other.created_at))
			return false;
		if (item_code == null) {
			if (other.item_code != null)
				return false;
		} else if (!item_code.equals(other.item_code))
			return false;
		if (item_name == null) {
			if (other.item_name != null)
				return false;
		} else if (!item_name.equals(other.item_name))
			return false;
		if (partner_order_id == null) {
			if (other.partner_order_id != null)
				return false;
		} else if (!partner_order_id.equals(other.partner_order_id))
			return false;
		if (partner_user_id == null) {
			if (other.partner_user_id != null)
				return false;
		} else if (!partner_user_id.equals(other.partner_user_id))
			return false;
		if (payload == null) {
			if (other.payload != null)
				return false;
		} else if (!payload.equals(other.payload))
			return false;
		if (payment_method_type == null) {
			if (other.payment_method_type != null)
				return false;
		} else if (!payment_method_type.equals(other.payment_method_type))
			return false;
		if (quantity == null) {
			if (other.quantity != null)
				return false;
		} else if (!quantity.equals(other.quantity))
			return false;
		if (sid == null) {
			if (other.sid != null)
				return false;
		} else if (!sid.equals(other.sid))
			return false;
		
		if (tid == null) {
			if (other.tid != null)
				return false;
		} else if (!tid.equals(other.tid))
			return false;
		
		return true;
	}
    
    
    
}
