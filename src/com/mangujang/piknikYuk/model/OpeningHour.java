package com.mangujang.piknikYuk.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="opening_hours")
public class OpeningHour {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="day")
	private int day;
	
	@Column(name="open_time")
	private String openTime;
	
	@Column(name="close_time")
	private String closeTime;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE, 
						CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="tour_location_id")
	private Tour tourLocation;

	public OpeningHour() {
		super();
	}

	public OpeningHour(int id, int day, String openTime, String closeTime) {
		super();
		this.id = id;
		this.day = day;
		this.openTime = openTime;
		this.closeTime = closeTime;
	}
	
	public OpeningHour(int day) {
		super();
		this.day = day;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public Tour getTourLocation() {
		return tourLocation;
	}

	public void setTourLocation(Tour tourLocation) {
		this.tourLocation = tourLocation;
	}

	@Override
	public String toString() {
		return "OpeningHour [id=" + id + ", day=" + day + ", openTime=" + openTime + ", closeTime=" + closeTime + "]";
	}
		
	
}
