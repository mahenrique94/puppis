package br.com.puppis.util;

public enum Parametros {

    DEFINICAO_PADRAO(0),
    DOCUMENTO_TRANSFERENCIA(4),
    EXTRATO_LANCAMENTOMANUAL(7),
    FINANCEIRO_ENTRADA(3),
    PAGAMENTO_AVISTA(1);

    private Object id;

    Parametros(Object id) {
        this.id = id;
    }
    public long toLong() {
        return (Long) id;
    }
    public int toInt() {
        return (Integer) id;
    }

}
