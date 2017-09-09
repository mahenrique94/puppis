package br.com.puppis.util;

public enum CreditoDebito {

    CREDITO("C"),
    DEBITO("D");

    private String creditoDebito;

    CreditoDebito(String creditoDebito) {
        this.creditoDebito = creditoDebito;
    }

    public String get() {
        return creditoDebito;
    }
}
