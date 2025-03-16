CREATE TABLE chicos (
    nombre VARCHAR2(30),
    provincia VARCHAR2(10)
);

CREATE TABLE chicas (
    nombre VARCHAR2(30),
    provincia VARCHAR2(10)
);

INSERT INTO chicos (nombre, provincia) VALUES ('Juan', 'VA');
INSERT INTO chicos (nombre, provincia) VALUES ('Pedro', 'VA');
INSERT INTO chicos (nombre, provincia) VALUES ('Luis', 'LE');
INSERT INTO chicos (nombre, provincia) VALUES ('Pablo', 'PA');
INSERT INTO chicos (nombre, provincia) VALUES ('Alberto', 'PA');

INSERT INTO chicas (nombre, provincia) VALUES ('Carmen', 'BU');
INSERT INTO chicas (nombre, provincia) VALUES ('Lola', 'SG');
INSERT INTO chicas (nombre, provincia) VALUES ('Patricia', 'SG');
INSERT INTO chicas (nombre, provincia) VALUES ('Maria', 'VA');
INSERT INTO chicas (nombre, provincia) VALUES ('Sofia', 'PA');