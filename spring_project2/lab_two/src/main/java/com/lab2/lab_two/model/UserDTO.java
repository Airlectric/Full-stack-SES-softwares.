package com.lab2.lab_two.model;

public class UserDTO {
    private Long id;
    private String schoolId;
    // Add other necessary user fields

    public UserDTO() {
        // Default constructor
    }

    public UserDTO(Long id, String schoolId /* Add other necessary user fields */) {
        this.id = id;
        this.schoolId = schoolId;
        // Set other necessary user fields
    }

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(String schoolId) {
        this.schoolId = schoolId;
    }

    // Add getters and setters for other necessary user fields

    // Other necessary methods
    @Override
    public String toString() {
        return "UserDTO{" +
                "id=" + id +
                ", schoolId='" + schoolId + '\'' +
                // Add other necessary user fields
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserDTO userDTO = (UserDTO) o;

        if (id != null ? !id.equals(userDTO.id) : userDTO.id != null) return false;
        return schoolId != null ? schoolId.equals(userDTO.schoolId) : userDTO.schoolId == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (schoolId != null ? schoolId.hashCode() : 0);
        return result;
    }
}
