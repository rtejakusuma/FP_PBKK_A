package com.mangujang.piknikYuk.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
	@Temporal(TemporalType.TIME)
	private Date openTime;
	
	@Column(name="close_time")
	@Temporal(TemporalType.TIME)
	private Date closeTime;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE, 
						CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="tour_location_id")
	private Tour tourLocation;

	public OpeningHour() {
		super();
	}

	public OpeningHour(int day, Date openTime, Date closeTime) {
		super();
		this.day = day;
		this.openTime = openTime;
		this.closeTime = closeTime;
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

	public Date getOpenTime() {
		return openTime;
	}

	public void setOpenTime(Date openTime) {
		this.openTime = openTime;
	}

	public Date getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(Date closeTime) {
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
