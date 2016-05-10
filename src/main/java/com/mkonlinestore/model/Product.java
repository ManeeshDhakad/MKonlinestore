package com.mkonlinestore.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

	@Id
    @Column(name="productId")
    @GeneratedValue
	private int productId;
	
	@Column(name="productCode")
	private String productCode;
	
	@Column(name="productCategory")
	private int productCategory;
	
	@Column(name="productName")
	private String productName;
	
	@Column(name="productPrice")
	private double productPrice;
	
	@Column(name="productDescription")
	private String productDescription;
	
	@Column(name="productImage")
	private byte[] productImage;
	
	@Column(name="productQuantity")
	private int productQuantity;
	
	@Column(name="productStatus")
	private String productStatus;

	public Product() {}

	public Product(int productId, String productCode, int productCategory,
			String productName, double productPrice, String productDescription,
			byte[] productImage, int productQuantity, String productStatus) {
		super();
		this.productId = productId;
		this.productCode = productCode;
		this.productCategory = productCategory;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDescription = productDescription;
		this.productImage = productImage;
		this.productQuantity = productQuantity;
		this.productStatus = productStatus;
	}

	public Product(String productCode, String productName,
			String productDescription, double productPrice,
			int productQuantity) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDescription = productDescription;
		this.productQuantity = productQuantity;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public int getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(int productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public byte[] getProductImage() {
		return productImage;
	}

	public void setProductImage(byte[] productImage) {
		this.productImage = productImage;
	}
	
	
	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	
}
