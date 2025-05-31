package com.org.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name="USER_Project")
public class User {
		
		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
		private Integer userId;
		private String userName;
		private String category;
		private String productName;
		private Long mobileNum;
		
}


