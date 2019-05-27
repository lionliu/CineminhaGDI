--Povoamento de OR
INSERT INTO TB_PESSOA VALUES (
    TP_PESSOA(
        1001,'Leao',to_date('19/03/1998', 'dd/mm/yy'),TP_ENDERECO(2001,'Lincoln Road','Miami Beach','Miami',005),TP_FONES(
            TP_FONE(999258866),TP_FONE(999256688),TP_FONE(988669925)
            )
    )
);