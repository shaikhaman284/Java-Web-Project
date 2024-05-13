package DatabaseDAO;

public class User {

    private int stdid;
    private String name;
    private String clgname;
    private String monum;
    private String email;
    private String password;

    /**
     * @return the stdid
     */
    public int getStdid() {
        return stdid;
    }

    /**
     * @param stdid the stdid to set
     */
    public void setStdid(int stdid) {
        this.stdid = stdid;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the clgname
     */
    public String getClgname() {
        return clgname;
    }

    /**
     * @param clgname the clgname to set
     */
    public void setClgname(String clgname) {
        this.clgname = clgname;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the monum
     */
    public String getMonum() {
        return monum;
    }

    /**
     * @param monum the monum to set
     */
    public void setMonum(String monum) {
        this.monum = monum;
    }

}
