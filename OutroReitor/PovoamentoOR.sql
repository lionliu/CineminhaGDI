--Povoamento de OR
INSERT INTO TB_PESSOA VALUES (
    TP_PESSOA(
        1001,'Leao',to_date('19/03/1998', 'dd/mm/yyyy'),TP_ENDERECO(2001,'Lincoln Road','Miami Beach','Miami',005),TP_FONES(
            TP_FONE(999258866),TP_FONE(999256688),TP_FONE(988669925)
            )
    )
);
INSERT INTO TB_FILME VALUES(
    TP_FILM(
        3001,
        16,
        to_date('28/05/2019','dd/mm/yyyy'),
        to_date('28/06/2019','dd/mm/yyyy'),
        'Chad Stahelski','Acao','John Wick 4',
        TP_NT_ATOR(
            TP_ATOR('Keanu Reeves'),
            TP_ATOR('Halle Berry'),
            TP_ATOR('Anjelica Huston'),
            TP_ATOR('Adiano')
            )
    )
);