CREATE OR REPLACE FUNCTION deletar_registro_log()
RETURNS TRIGGER AS $$
BEGIN
    DECLARE
        tabela_afetada VARCHAR(255);
        colunas_afetadas VARCHAR(255);
    BEGIN
        tabela_afetada := TG_TABLE_NAME;
        colunas_afetadas := TG_ARGV[0];
        
        INSERT INTO log(titulo, descricao, data)
        VALUES (
            'Registro Deletado em ' || tabela_afetada,
            to_json(OLD),
            NOW()
        );

        EXECUTE 'DELETE FROM ' || tabela_afetada || ' WHERE ' || colunas_afetadas || ' = $1' USING OLD;

        RETURN OLD;
    END;
END;
$$ LANGUAGE plpgsql;

DO $$ 
DECLARE
    tabela_atual VARCHAR(255);
BEGIN
    FOR tabela_atual IN (SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_type = 'BASE TABLE') 
    LOOP
        EXECUTE 'CREATE TRIGGER trigger_deletar_registro_log_' || tabela_atual || ' BEFORE DELETE ON ' || tabela_atual || ' FOR EACH ROW EXECUTE FUNCTION deletar_registro_log()';
    END LOOP;
END $$;