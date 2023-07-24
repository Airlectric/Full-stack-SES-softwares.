package com.lab2.lab_two.model;

public class LoginResponseDTO {
    private String authToken;
    private UserDTO user;

    public LoginResponseDTO() {
        // Default constructor
    }

    public LoginResponseDTO(String authToken, UserDTO user) {
        this.authToken = authToken;
        this.user = user;
    }

    // Getters and setters
    public String getAuthToken() {
        return authToken;
    }

    public void setAuthToken(String authToken) {
        this.authToken = authToken;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    // Other necessary methods
    @Override
    public String toString() {
        return "LoginResponseDTO{" +
                "authToken='" + authToken + '\'' +
                ", user=" + user +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LoginResponseDTO that = (LoginResponseDTO) o;

        if (authToken != null ? !authToken.equals(that.authToken) : that.authToken != null) return false;
        return user != null ? user.equals(that.user) : that.user == null;
    }

    @Override
    public int hashCode() {
        int result = authToken != null ? authToken.hashCode() : 0;
        result = 31 * result + (user != null ? user.hashCode() : 0);
        return result;
    }
}
