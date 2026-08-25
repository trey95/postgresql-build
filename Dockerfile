FROM tensorchord/vchord-scratch:pg18-v1.1.1 AS vchord_scratch
FROM postgres:18-trixie
RUN apt-get update && apt-get install -y postgresql-18-pgvector && rm -rf /var/lib/apt/lists/*
COPY --from=vchord_scratch / /
CMD ["postgres", "-c", "shared_preload_libraries=vchord,vector"]
