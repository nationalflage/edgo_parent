package com.hyjx.business.niuhp_study;

import java.util.List;

/**
 * 部门实体类
 * @author i
 *
 */
public class NiuhpDept {
	private String code;
	private String name;
	private String parentcode;
	private Integer  orderid;
	private String codetable;
	private String validfag;
	private List<NiuhpDept>children;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParentcode() {
		return parentcode;
	}
	public void setParentcode(String parentcode) {
		this.parentcode = parentcode;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public String getCodetable() {
		return codetable;
	}
	public void setCodetable(String codetable) {
		this.codetable = codetable;
	}
	public String getValidfag() {
		return validfag;
	}
	public void setValidfag(String validfag) {
		this.validfag = validfag;
	}
	public List<NiuhpDept> getChildren() {
		return children;
	}
	public void setChildren(List<NiuhpDept> children) {
		this.children = children;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((children == null) ? 0 : children.hashCode());
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		result = prime * result + ((codetable == null) ? 0 : codetable.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((orderid == null) ? 0 : orderid.hashCode());
		result = prime * result + ((parentcode == null) ? 0 : parentcode.hashCode());
		result = prime * result + ((validfag == null) ? 0 : validfag.hashCode());
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
		NiuhpDept other = (NiuhpDept) obj;
		if (children == null) {
			if (other.children != null)
				return false;
		} else if (!children.equals(other.children))
			return false;
		if (code == null) {
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		if (codetable == null) {
			if (other.codetable != null)
				return false;
		} else if (!codetable.equals(other.codetable))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (orderid == null) {
			if (other.orderid != null)
				return false;
		} else if (!orderid.equals(other.orderid))
			return false;
		if (parentcode == null) {
			if (other.parentcode != null)
				return false;
		} else if (!parentcode.equals(other.parentcode))
			return false;
		if (validfag == null) {
			if (other.validfag != null)
				return false;
		} else if (!validfag.equals(other.validfag))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "NiuhpDept [code=" + code + ", name=" + name + ", parentcode=" + parentcode + ", orderid=" + orderid
				+ ", codetable=" + codetable + ", validfag=" + validfag + ", children=" + children + "]";
	}
	
}
