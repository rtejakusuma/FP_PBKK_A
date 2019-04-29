package com.mangujang.piknikYuk.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tour_locations")
public class Tour {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="description")
	private String description;
	
	@Column(name="location")
	private String location;

	@Column(name="capacity")
	private int capacity;
	
	@Column(name="weekday_price")
	private double weekdayPrice;
	
	@Column(name="weekend_price")
	private double weekendPrice;
	
	public Tour() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public double getWeekdayPrice() {
		return weekdayPrice;
	}

	public void setWeekdayPrice(double weekdayPrice) {
		this.weekdayPrice = weekdayPrice;
	}

	public double getWeekendPrice() {
		return weekendPrice;
	}

	public void setWeekendPrice(double weekendPrice) {
		this.weekendPrice = weekendPrice;
	}

	@Override
	public String toString() {
		return "Tour [id=" + id + ", name=" + name + ", description=" + description + ", location=" + location
				+ ", capacity=" + capacity + ", weekdayPrice=" + weekdayPrice + ", weekendPrice=" + weekendPrice + "]";
	}
	
	
}
