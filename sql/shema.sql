# EMNIYET MUDURLUGU YONETIM VE OLAY TAKIP SISTEMI

# 1. DEPARTMENT: Emniyet birimleri
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(150)
);

# 2. RANK: Polis rutbeleri
CREATE TABLE rank (
    rank_id INT PRIMARY KEY,
    rank_name VARCHAR(50) NOT NULL
);

# 3. POLICE_OFFICER: Polis memurlari
CREATE TABLE police_officer (
    officer_id INT PRIMARY KEY,
    registration_number VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15),
    rank_id INT,
    department_id INT,

    CONSTRAINT fk_officer_rank
        FOREIGN KEY (rank_id)
        REFERENCES rank(rank_id),

    CONSTRAINT fk_officer_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);

# 4. CITIZEN: Vatandas bilgileri
CREATE TABLE citizen (
    citizen_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    national_id VARCHAR(11) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(200),
    birth_date DATE
);

# 5. INCIDENT: Olay bilgileri
CREATE TABLE incident (
    incident_number INT PRIMARY KEY,
    incident_type VARCHAR(100) NOT NULL,
    incident_date DATE NOT NULL,
    incident_time TIME,
    location VARCHAR(200),
    description TEXT,
    status VARCHAR(30)
);

# 6. REPORT: Ihbar kayitlari
CREATE TABLE report (
    report_id INT PRIMARY KEY,
    report_date DATE NOT NULL,
    report_time TIME,
    description TEXT,
    incident_number INT,
    national_id VARCHAR(11),

    CONSTRAINT fk_report_incident
        FOREIGN KEY (incident_number)
        REFERENCES incident(incident_number),

    CONSTRAINT fk_report_citizen
        FOREIGN KEY (national_id)
        REFERENCES citizen(national_id)
);

# 7. OFFICER_INCIDENT: Polis ve olay iliskisi
CREATE TABLE officer_incident (
    personnel_number INT,
    incident_number INT,

    PRIMARY KEY (personnel_number, incident_number),

    CONSTRAINT fk_officer_incident_officer
        FOREIGN KEY (personnel_number)
        REFERENCES police_officer(officer_id),

    CONSTRAINT fk_officer_incident_incident
        FOREIGN KEY (incident_number)
        REFERENCES incident(incident_number)
);

# 8. CITIZEN_RECORD: Vatandas olay kayitlari
CREATE TABLE citizen_record (
    record_id INT PRIMARY KEY,
    citizen_id INT NOT NULL,
    incident_number INT NOT NULL,
    record_date DATE NOT NULL,
    description TEXT,
    record_status VARCHAR(30),

    CONSTRAINT fk_record_citizen
        FOREIGN KEY (citizen_id)
        REFERENCES citizen(citizen_id),

    CONSTRAINT fk_record_incident
        FOREIGN KEY (incident_number)
        REFERENCES incident(incident_number)
);
