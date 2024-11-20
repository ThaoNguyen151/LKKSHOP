/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author NGUYENTRAN
 */
public class UserError {
    private String userIDError = "";
    private String fullNameError = "";
    private String roleIDError = "";
    private String passwordError = "";
    private String confirmError = "";
    private String error = "";
    private String priceError="";
    private String quantityError="";
    private String BrandError="";
    
    public UserError() {
    }

    public UserError(String userIDError, String fullNameError, String roleIDError, String passwordError, String confirmError, String error) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.roleIDError = roleIDError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.error = error;
    }
    
    public UserError(String userIDError, String fullNameError, String roleIDError, String passwordError, String confirmError, String error, String priceError, String quantityError) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.roleIDError = roleIDError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.error = error;
        this.priceError = priceError;
        this.quantityError = quantityError;
    }
    

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getBrandError() {
        return BrandError;
    }

    public void setBrandError(String BrandError) {
        this.BrandError = BrandError;
    }
    
    

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
}
