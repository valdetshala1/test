DROP TABLE IF EXISTS TFIN_TYPE CASCADE;

--finance  
CREATE TABLE TFIN_TYPE 
(
    id bigserial primary key, 
    parent_id integer references TFIN_TYPE(id),
    code  character varying(20) NOT NULL unique,
	level smallint NOT NULL,
	type VARCHAR(2),
	allocation boolean NOT NULL DEFAULT false,
    name_al character varying(100) NOT NULL,
	name_en character varying(100),
    name_sr character varying(100),
	notes character varying(255),
	created_date date NOT NULL
);
ALTER TABLE TFIN_TYPE OWNER TO POSTGRES;

insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (1, null, '0', 0, null, false, 'Kodi Ekonomik', 'Economic Code', 'Economic Code', null, '2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (2, 1, '11', 1, null, false, 'Rrogat dhe pagat', 'Rrogat dhe pagat', 'Rrogat dhe pagat', null, '2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (3, 1, '13', 1, null, false, 'Mallra dhe shërbime', 'Mallra dhe shërbime', 'Mallra dhe shërbime', null, '2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (4, 1, '111', 2, null, false, 'Rrogat mujore me orar të plotë', 'Rrogat mujore me orar të plotë', 'Rrogat mujore me orar të plotë', null, '2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (5, 2, '130', 2, null, false, 'Mallra dhe shërbime', 'Mallra dhe shërbime', 'Mallra dhe shërbime', null, '2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (6, 3, '1110', 3, 'IN', false, 'Rrogat mujore me orar te plote', 'Rrogat mujore me orar te plote', 'Rrogat mujore me orar te plote', null ,'2020/02/26');
insert into tfin_type (id, parent_id, code, level, type, allocation, name_al, name_en, name_sr, notes, created_date) values (7, 6, '11110', 4, 'IN', false, 'Pagat neto permes listes se pagave', 'Pagat neto permes listes se pagave', 'Pagat neto permes listes se pagave', null, '2020/02/26');
insert into tfin_type values(((select count(*) from tfin_type)+1), (select id from tfin_type where code = '1110'), '11115', 5, 'IN', false, 'Pagesa per sindikat', 'Pagesa per sindikat', 'Pagesa per sindikat', null, '2020/02/26');
insert into tfin_type values(((select count(*) from tfin_type)+1), (select id from tfin_type where code = '1110'), '11120', 5, 'IN', false, 'PAGESAT E SHTESES NE PAGE-30 EURO PER SHCK', 'PAGESAT E SHTESES NE PAGE-30 EURO PER SHCK', null, null, '2020/02/26');
insert into tfin_type values(((select count(*) from tfin_type)+2), (select id from tfin_type where code = '1110'), '11125', 5, 'IN', false, 'ANTARSIM-ODA E INFERMIERVE TE KOSOVËS', 'ANTARSIM-ODA E INFERMIERVE TE KOSOVËS', 'ANTARSIM-ODA E INFERMIERVE TE KOSOVËS', null, '2020/02/26');
insert into tfin_type values(((select count(*) from tfin_type)+2), (select id from tfin_type where code = '1110'), '11126', 5, 'IN', false, 'ANTARSIM-ODA E MJEKVE TE KOSOVËS', 'ANTARSIM-ODA E MJEKVE TE KOSOVËS', 'ANTARSIM-ODA E MJEKVE TE KOSOVËS', null, '2020/02/26');
insert into tfin_type values(((select count(*) from tfin_type)+2), (select id from tfin_type where code = '1110'), '11155', 5, 'IN', false, 'SHTESAT DHE KOMPENZIMET TJERA(VENDIM)', 'SHTESAT DHE KOMPENZIMET TJERA(VENDIM)', null, null ,'2020/02/26');
insert into tfin_type values(16, (select id from tfin_type where code = '1110'), '111556', 5, 'IN', false, 'SHTESAT DHE KOMPENZIMET TJERA(VENDIM)', 'SHTESAT DHE KOMPENZIMET TJERA(VENDIM)', null, null ,'2020/02/26');


ALTER TABLE tfin_input ADD COLUMN IF NOT EXISTS input_date date not null DEFAULT now();

--constrain in other table 
ALTER TABLE public.tfin_input
    ADD CONSTRAINT tfin_input_input_type_id_fkey FOREIGN KEY (input_type_id)
        REFERENCES public.tfin_type (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;
		
delete from tfin_output;
ALTER TABLE public.tfin_output
    ADD CONSTRAINT tfin_output_expenditure_type_fkey FOREIGN KEY (expenditure_type)
        REFERENCES public.tfin_type (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;
		
ALTER TABLE public.tfin_budget_mainntenance
    ADD CONSTRAINT tfin_budget_mainntenance_fin_type_id_fkey FOREIGN KEY (fin_type_id)
        REFERENCES public.tfin_type (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

DROP VIEW IF EXISTS tfin_type_tree;
CREATE VIEW tfin_type_tree AS
 WITH RECURSIVE tfin_type_tree(id, parent_id, name_al, name_en, name_sr, notes, created_date, allocation, type, code, path, level) AS (
         SELECT tfin_type.id,
            tfin_type.parent_id,
            tfin_type.name_al,
	 		tfin_type.name_en,
	 		tfin_type.name_sr,
	 		tfin_type.notes,
	 		tfin_type.created_date,
	 		tfin_type.allocation,
	        tfin_type.type,
            tfin_type.code,
            NULL::integer[] || tfin_type.parent_id,
            1
           FROM tfin_type
          WHERE tfin_type.parent_id is null
        UNION ALL
         SELECT t.id,
            t.parent_id,
            t.name_al,
	 		t.name_en,
	 		t.name_sr,
	 		t.notes,
	 		t.created_date,
	 		t.allocation,
	 		t.type,
            t.code,
            rt.path || t.parent_id,
            rt.level + 1
           FROM tfin_type t
             JOIN tfin_type_tree rt ON rt.id = t.parent_id
        )
 SELECT tfin_type_tree.id,
    tfin_type_tree.parent_id,
    tfin_type_tree.name_al,
	tfin_type_tree.name_en,
	tfin_type_tree.name_sr,
    tfin_type_tree.code,
    tfin_type_tree.path,
    tfin_type_tree.level,
	tfin_type_tree.allocation,
	tfin_type_tree.type,
	tfin_type_tree.notes,
	tfin_type_tree.created_date
   FROM tfin_type_tree
  ORDER BY tfin_type_tree.id, tfin_type_tree.parent_id, tfin_type_tree.code;


		

--	norma tatimore	|	Të ardhurat mujore	|	Të ardhurat vjetore
-- 	0%				|	0 deri 80			|	0 deri 960
-- 	4%				|	80 deri 25			|	960 deri 3000
-- 	8%				|	250 deri 450		|	960 deri 3000
-- 	4%				|	80 deri 25			|	960 deri 3000

DROP TABLE IF EXISTS THRM_EMPLOYEE_SALARY_TAX_RATES;
CREATE TABLE THRM_EMPLOYEE_SALARY_TAX_RATES (
	ID BIGSERIAL PRIMARY KEY,
	TAX_NORM_NAME character varying(30) NOT NULL,
	PERCENTAGE DECIMAL(3,2) NOT NULL,
	START_AMOUNT DECIMAL(8,2) NOT NULL,
	END_AMOUNT DECIMAL(8,2) NOT NULL,
	VALID_DATE_FROM DATE NOT NULL,
	VALID_DATE_TO DATE NOT NULL,
	VALID boolean default true NOT NULL,
	NOTE TEXT,
	CREATED_BY INTEGER NOT NULL,
	CREATED_DATE TIMESTAMP NOT NULL DEFAULT NOW(),
	
	FOREIGN KEY (CREATED_BY) REFERENCES TPERSON (ID)   
);
	
DROP TABLE IF EXISTS THRM_EMPLOYEE_SALARY CASCADE;
CREATE TABLE THRM_EMPLOYEE_SALARY (
	ID BIGSERIAL PRIMARY KEY,
	EMPLOYEE_ID INTEGER NOT NULL,
	--SALARY NUMBER(8,2) NOT NULL,
	--commission_pct NUMBER(2,2) NOT NULL,
	--PFID] [bigint] NULL,
	
	GrossSalary DECIMAL(8,2), --The gross salary received by employee.
	BasicSalary DECIMAL(8,2), --The basic gross salary for the year.
	RegularWorkHours INTEGER, --regular work hours for month.
	
	PayPeriod varchar(1) default 'm' NOT NULL, -- pay period/frequency: weekly=w , monthly=m, quartly=q, yearly=y
	AutoPay boolean default false NOT NULL,
	
	
	CREATED_BY INTEGER NOT NULL,
	CREATED_DATE TIMESTAMP NOT NULL DEFAULT NOW(),
	
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES THRM_EMPLOYEE (ID),
	FOREIGN KEY (CREATED_BY) REFERENCES TPERSON (ID)
);

DROP TABLE IF EXISTS THRM_EMPLOYEE_SALARY_PAYROLL CASCADE;
CREATE TABLE THRM_EMPLOYEE_SALARY_PAYROLL (
	ID BIGSERIAL PRIMARY KEY,
	EMPLOYEE_ID INTEGER NOT NULL,
	SALARY_ID INTEGER NOT NULL,
	FIN_TYPE_ID INTEGER, -- is there code for payment?
	FISCAL_YEAR INTEGER NOT NULL,
	PAY_MONTH SMALLINT NOT NULL,
	PAYROLL_DATE DATE NOT NULL,
	START_DATE DATE NOT NULL,
	END_DATE DATE NOT NULL,
	TaxPay DECIMAL(8,2) NOT NULL, -- The amount of Professional Tax to be deducted.
	GrossPay DECIMAL(8,2) NOT NULL, --The gross total received by employee.
	NetPay DECIMAL(8,2) NOT NULL, --The total salary received after deduction.
	SalaryYear DECIMAL(8,2) NOT NULL, --The total salary for the year.
	SalaryMonth DECIMAL(8,2) NOT NULL, --The month of salary
	HOURSWORKED DECIMAL(8,2),
	STATUS VARCHAR(3) NOT NULL default 'NEW', -- NEW=New Payslip, CAL=Calculation Successful , FIN=The calendar run has been finalized. You can no longer make changes. 
	--Finalized — With Banking. Segment has been finalized and run through the Banking process. This status occurs if you run the Finalize step and then the Banking process.
	FIN_DATE TIMESTAMP,
	
	CREATED_BY INTEGER NOT NULL,
	CREATED_DATE TIMESTAMP NOT NULL DEFAULT NOW(),
--	FundPay money NOT NULL, --THRM_EMPLOYEE_SALARY_DEDUCTIONS
--	
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES THRM_EMPLOYEE (ID),
	FOREIGN KEY (SALARY_ID) REFERENCES THRM_EMPLOYEE_SALARY (ID),
	FOREIGN KEY (FIN_TYPE_ID) REFERENCES TFIN_TYPE (ID),
	FOREIGN KEY (CREATED_BY) REFERENCES TPERSON (ID),
	
	constraint PAYROLL_EMPLOYEE_YEAR_MONTH_constrainte unique (EMPLOYEE_ID, FISCAL_YEAR, PAY_MONTH)
);

/*
Salary Type = B (Gross), N (Net)
Calculation Type={1,2,3,4}
1=ADDS (Salary additions)
2=DEDUCTIONS (Salary deductions)
3=NOP (Only row calculation. No Salary impacts)
4=NET (Only row calculation. By status CAL and FIN the net amount caluculated)
*/

ALTER TABLE IF EXISTS thrm_employee_salary_adjustment 
  DROP CONSTRAINT IF EXISTS thrm_employee_salary_adjustment_amount_check;

/*
1. ONGRO (ADD, SUB) 	--calc on gross
2. BFTAX (SUB, NOP)	--calc befor tax
3. ONTAX (NOP)		--calc of tax based on tax norms
4. AFTAX (ADD, SUB)	--calc after tax
5. ONNET (ADD, SUB)	--calc on tax

Tipi i llogaritjes 
1. ADD
2. SUB
3. NOP
*/
DROP TABLE IF EXISTS THRM_EMPLOYEE_SALARY_ADJUSTMENT;
CREATE TABLE THRM_EMPLOYEE_SALARY_ADJUSTMENT(
	ID BIGSERIAL PRIMARY KEY,
	EMPLOYEE_ID INTEGER NOT NULL,
	SALARY_ID INTEGER NOT NULL,
	ADJUSTMENT_DATE DATE NOT NULL,
	FIN_TYPE_ID INTEGER NOT NULL,
	CALCULATION_TYPE VARCHAR(3) NOT NULL CHECK (CALCULATION_TYPE IN ('ADD', 'SUB', 'NOP')),  
	AMOUNT_TYPE VARCHAR(5) NOT NULL CHECK (AMOUNT_TYPE IN ('ONGRO', 'BFTAX', 'ONTAX', 'AFTAX', 'ONNET', 'FINET')), 
	AMOUNT DECIMAL(8,2),
	AMOUNT_PERCENTAGE DECIMAL(5,2), 	
	AMOUNT_PERCENTAGE_CALC DECIMAL(8,2),																 
	HOURSWORKED DECIMAL(8,2),
	HOURLYRATE DECIMAL(8,2),
	NOTE TEXT,
	
	CREATED_BY INTEGER NOT NULL,
	CREATED_DATE TIMESTAMP NOT NULL DEFAULT NOW(),
	
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES THRM_EMPLOYEE (ID),
	FOREIGN KEY (SALARY_ID) REFERENCES THRM_EMPLOYEE_SALARY (ID),
	FOREIGN KEY (FIN_TYPE_ID) REFERENCES TFIN_TYPE (ID),
	FOREIGN KEY (CREATED_BY) REFERENCES TPERSON (ID),
	
	constraint FIN_TYPE_BY_SALARY_constrainte unique (SALARY_ID, FIN_TYPE_ID)
	
);	
	
ALTER TABLE IF EXISTS THRM_EMPLOYEE_SALARY_PAYROLL_ADJUSTMENT 
  DROP CONSTRAINT IF EXISTS THRM_EMPLOYEE_SALARY_PAYROLL_ADJUSTMENT_amount_check;
	/*											 
Tipi i vlerës / koha e llogaritjes / steps:
1. ONGRO (ADD, SUB) 	--calc on gross
2. BFTAX (SUB, NOP)	--calc befor tax
3. ONTAX (NOP)		--calc of tax based on tax norms
4. AFTAX (ADD, SUB)	--calc after tax
5. ONNET (ADD, SUB)	--calc on tax

Tipi i llogaritjes 
1. ADD
2. SUB
3. NOP
*/
												 
DROP TABLE IF EXISTS THRM_EMPLOYEE_SALARY_PAYROLL_ADJUSTMENT;
CREATE TABLE THRM_EMPLOYEE_SALARY_PAYROLL_ADJUSTMENT(
	ID BIGSERIAL PRIMARY KEY,
	EMPLOYEE_ID INTEGER NOT NULL,
	PAYROLL_ID INTEGER NOT NULL,
	ADJUSTMENT_DATE DATE NOT NULL,
	FIN_TYPE_ID INTEGER NOT NULL,
	CALCULATION_TYPE VARCHAR(3) NOT NULL CHECK (CALCULATION_TYPE IN ('ADD', 'SUB', 'NOP')),  
	AMOUNT_TYPE VARCHAR(5) NOT NULL CHECK (AMOUNT_TYPE IN ('ONGRO', 'BFTAX', 'ONTAX', 'AFTAX', 'ONNET', 'FINET')), 
	AMOUNT DECIMAL(8,2), --NUMERIC
	AMOUNT_PERCENTAGE DECIMAL(5,2), 	
	AMOUNT_PERCENTAGE_CALC DECIMAL(8,2),																 																 
	HOURSWORKED DECIMAL(8,2),
	HOURLYRATE DECIMAL(8,2),
	NOTE TEXT,
	
	CREATED_BY INTEGER NOT NULL,
	CREATED_DATE TIMESTAMP NOT NULL DEFAULT NOW(),
	
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES THRM_EMPLOYEE (ID),
	FOREIGN KEY (PAYROLL_ID) REFERENCES THRM_EMPLOYEE_SALARY_PAYROLL (ID),
	FOREIGN KEY (FIN_TYPE_ID) REFERENCES TFIN_TYPE (ID),
	FOREIGN KEY (CREATED_BY) REFERENCES TPERSON (ID),
	
	constraint FIN_TYPE_BY_PAYROLL_constrainte unique (FIN_TYPE_ID, PAYROLL_ID)
	
);

-- dont forget to check bevore CAL and FIN if tax rates are avaliable
insert into thrm_employee_salary_tax_rates values (((select count(*) from thrm_employee_salary_tax_rates)+1), 'N1', 0.00, 0, 80, '2020-01-01', '2050-01-01', true, null, 632, '2020-01-01');
insert into thrm_employee_salary_tax_rates values (((select count(*) from thrm_employee_salary_tax_rates)+1), 'N2', 0.04, 80, 250, '2020-01-01', '2050-01-01', true, null, 632, '2020-01-01');
insert into thrm_employee_salary_tax_rates values (((select count(*) from thrm_employee_salary_tax_rates)+1), 'N3', 0.08, 250, 450, '2020-01-01', '2050-01-01', true, null, 632, '2020-01-01');
insert into thrm_employee_salary_tax_rates values (((select count(*) from thrm_employee_salary_tax_rates)+1), 'N4', 0.10, 450, 100000.0, '2020-01-01', '2050-01-01', true, null, 632, '2020-01-01');


--ALTER TABLE thrm_employee_salary_adjustment DROP constraint IF EXISTS thrm_employee_salary_adjustment_calculation_type_check;
--ALTER TABLE thrm_employee_salary_payroll_adjustment DROP constraint IF EXISTS thrm_employee_salary_payroll_adjustment_calculation_type_check;