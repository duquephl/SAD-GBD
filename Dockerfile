# Use a imagem oficial do PostgreSQL como base
FROM postgres:latest

# Defina as variáveis de ambiente para configurar o usuário e a senha
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Defina o nome do banco de dados (opcional)
ENV POSTGRES_DB=postgres

# Exponha a porta padrão do PostgreSQL
EXPOSE 5432
