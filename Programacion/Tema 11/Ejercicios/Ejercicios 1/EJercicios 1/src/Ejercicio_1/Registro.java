package Ejercicio_1;

import java.time.LocalDateTime;

public class Registro {
    private int id;
    private String firstName;
    private String lastName;
    private double latitude;
    private double longitude;
    private String domain;
    private String email;
    private String country;
    private String ipAddress;
    private LocalDateTime lastLogin;

    public Registro(int id, String firstName, String lastName, double latitude, double longitude, String domain, String email, String country, String ipAddress, LocalDateTime lastLogin) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.latitude = latitude;
        this.longitude = longitude;
        this.domain = domain;
        this.email = email;
        this.country = country;
        this.ipAddress = ipAddress;
        this.lastLogin = lastLogin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public LocalDateTime getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(LocalDateTime lastLogin) {
        this.lastLogin = lastLogin;
    }

    @Override
    public String toString() {
        return "Registro{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", domain='" + domain + '\'' +
                ", email='" + email + '\'' +
                ", country='" + country + '\'' +
                ", ipAddress='" + ipAddress + '\'' +
                ", lastLogin='" + lastLogin + '\'' +
                '}';
    }
}

