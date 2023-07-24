package com.lab2.lab_two.model;

public class UserUpdateRequest {
    private String username;
    private String email;
    // Add other necessary fields

    public UserUpdateRequest() {
        // Default constructor
    }

    public UserUpdateRequest(String username, String email /* Add other necessary fields */) {
        this.username = username;
        this.email = email;
        // Set other necessary fields
    }

    // Getters and setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Add getters and setters for other necessary fields

    // Other necessary methods
    @Override
    public String toString() {
        return "UserUpdateRequest{" +
                "username='" + username + '\'' +
                ", email='" + email + '\'' +
                // Add other necessary fields
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserUpdateRequest that = (UserUpdateRequest) o;

        if (username != null ? !username.equals(that.username) : that.username != null) return false;
        return email != null ? email.equals(that.email) : that.email == null;
    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (email != null ? email.hashCode() : 0);
        return result;
    }
}

