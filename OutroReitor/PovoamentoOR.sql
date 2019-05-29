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

INSERT INTO TB_CINEMA VALUES(
    TP_CINEMA(
        8971,
        1,
        'Assembleia de Deus',
        TP_ENDERECO(
            4171,
            'Da Paz',
            'Ceu',
            8969,
            'Nuvem 2'
        )
    )
);

INSERT INTO TB_CINEMA VALUES(
    TP_CINEMA(
        1001,
        12,
        'Disney',
        TP_ENDERECO(
            9821,
            'Paranaue',
            'Recife',
            697,
            'Paranaua'
        )
    )
);

INSERT INTO TB_SNACK_BAR VALUES(
    TP_SNACK_BAR(
        0006,
        (SELECT REF(C) FROM TB_CINEMA C 
        WHERE CNPJ=8971),
        timestamp '2019-04-23 8:00:00',
        timestamp '2019-04-23 21:00:00'
    )
);

INSERT INTO TB_SNACK_BAR VALUES(
    TP_SNACK_BAR(
        1002,
        (SELECT REF(C) FROM TB_CINEMA C 
        WHERE CNPJ=1001),
        timestamp '2019-04-23 6:00:00',
        timestamp '2019-04-23 23:00:00'
    )
);

