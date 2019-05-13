package com.mangujang.piknikYuk.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
	
	@OneToMany(mappedBy="tourLocation", cascade={CascadeType.ALL})
	private List<OpeningHour> openingHours;
	
	public Tour() {
		
	}

	public Tour(String name, String description, String location) {
		super();
		this.name = name;
		this.description = description;
		this.location = location;
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

	public List<OpeningHour> getOpeningHour() {
		return openingHours;
	}

	public void setOpeningHour(List<OpeningHour> openingHour) {
		this.openingHours = openingHour;
	}

	@Override
	public String toString() {
		return "Tour [id=" + id + ", name=" + name + ", description=" + description + ", location=" + location
				+ ", capacity=" + capacity + ", weekdayPrice=" + weekdayPrice + ", weekendPrice=" + weekendPrice + "]";
	}
	
	// bi-directional convenience method
	public void add(OpeningHour tempOpeningHour) {
		if(openingHours == null) {
			openingHours = new ArrayList<>();
		}
		
		openingHours.add(tempOpeningHour);
		
		tempOpeningHour.setTourLocation(this);
	}
	
	
}
