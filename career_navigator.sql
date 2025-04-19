-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2025 at 06:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `career_navigator`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `skills_required` text NOT NULL,
  `job_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `company`, `skills_required`, `job_url`) VALUES
(1, 'Certified Nursing Assistant', 'The Job Network', 'care, nursing, shift, health, assistant, benefits, medical', 'https://www.linkedin.com/jobs/view/3906249391/?trk=jobs_biz_prem_srch'),
(2, 'Certified Nursing Assistant', 'The Job Network', 'care, nursing, shift, benefits, assistant, performs, health', 'https://www.linkedin.com/jobs/view/3906249392/?trk=jobs_biz_prem_srch'),
(3, 'Float Licensed Optician', 'The Job Network', 'care, associates, patient, vision, practice, center, location', 'https://www.linkedin.com/jobs/view/3906249397/?trk=jobs_biz_prem_srch'),
(4, 'Accounts Payable Assistant - $19/hr', 'The Job Network', 'accounts, office, location, construction, assistant, finance, test', 'https://www.linkedin.com/jobs/view/3906249403/?trk=jobs_biz_prem_srch'),
(5, 'Financial Accountant I', 'Texas A&M University', 'financial, travel, employee, accounting, operations, customer, compliance', 'https://www.linkedin.com/jobs/view/3906249420/?trk=jobs_biz_prem_srch'),
(6, 'Licensed Practical Nurse I DAYS FULL-TIME $30.20 - $36.35 / hour', 'The Job Network', 'care, members, nurse, range, state, communities, family', 'https://www.linkedin.com/jobs/view/3906249423/?trk=jobs_biz_prem_srch'),
(7, 'Senior E-Commerce Manager - NYC', 'Hire With Jarvis', 'email, marketing, product, director, excel, industry, strategies', 'https://www.linkedin.com/jobs/view/3906249433/?trk=jobs_biz_prem_srch'),
(8, 'Head Teller', 'Bethpage Federal Credit Union', 'member, advanced, includes, team, collaborate, daily, required', 'https://www.linkedin.com/jobs/view/3906249434/?trk=jobs_biz_prem_srch'),
(9, 'Substation Protection & Control Technician', 'LG&E and KU Energy LLC', 'control, equipment, assist, testing, electrical, maintenance, test', 'https://www.linkedin.com/jobs/view/3906249437/?trk=jobs_biz_prem_srch'),
(10, 'Cybersecurity Risk Lead', 'PPL Corporation', 'risk, security, energy, managing, program, drive, documentation', 'https://www.linkedin.com/jobs/view/3906249438/?trk=jobs_biz_prem_srch'),
(11, 'Trained Medication Assistant TMA', 'Ecumen', 'assistant, nursing, care, nurse, facility, hour, provided', 'https://www.linkedin.com/jobs/view/3906249440/?trk=jobs_biz_prem_srch'),
(12, 'Board Certified Behavior Analyst (BCBA)', 'The Job Network', 'days, collaborate, client, application, programs, employee, total', 'https://www.linkedin.com/jobs/view/3906249442/?trk=jobs_biz_prem_srch'),
(13, 'Assistant Fabrication Superintendent', 'Schuff Steel', 'production, planning, open, control, inclusive, software, leadership', 'https://www.linkedin.com/jobs/view/3906249457/?trk=jobs_biz_prem_srch'),
(14, 'Occupational Therapist - Outpatient', 'PT Solutions Physical Therapy', 'patients, patient, care, quality, program, access, daily', 'https://www.linkedin.com/jobs/view/3906249460/?trk=jobs_biz_prem_srch'),
(15, 'Program Supervisor, School-Age', 'YMCA of Greater Seattle', 'school, site, program, vision, programs, planning, community', 'https://www.linkedin.com/jobs/view/3906249462/?trk=jobs_biz_prem_srch'),
(16, 'Registered Nurse Operating Room - Mobile Surgery Center', 'SCA Health', 'care, nursing, patient, certification, current, health, support', 'https://www.linkedin.com/jobs/view/3906249477/?trk=jobs_biz_prem_srch'),
(17, 'RN PreOp PACU - Memorial Care Outpatient Surgery Center Long Beach', 'SCA Health', 'care, patient, patients, managing, support, nursing, health', 'https://www.linkedin.com/jobs/view/3906249478/?trk=jobs_biz_prem_srch'),
(18, 'Channel Manager (Northeast)', 'Veeam Software', 'data, partner, partners, cloud, travel, personal, sales', 'https://www.linkedin.com/jobs/view/3906249480/?trk=jobs_biz_prem_srch'),
(19, 'Part Time - Member Consultant (Personal Banker) - Thurston County Branches', 'WSECU', 'members, need, leave, member, paid, employees, hours', 'https://www.linkedin.com/jobs/view/3906249494/?trk=jobs_biz_prem_srch'),
(20, 'Behavior Technician (BT) / Registered Behavior Technician (RBT)', 'The Job Network', 'registered, career, development, school, programs, implementation, impact', 'https://www.linkedin.com/jobs/view/3906249497/?trk=jobs_biz_prem_srch'),
(21, 'Clinical Staff Pharmacist - 7on 7off nights', 'CPS', 'clinical, patient, medical, care, healthcare, access, team', 'https://www.linkedin.com/jobs/view/3906249501/?trk=jobs_biz_prem_srch'),
(22, 'store driver', 'Advance Auto Parts', 'employee, store, performing, job, safety, customers, vision', 'https://www.linkedin.com/jobs/view/3906249511/?trk=jobs_biz_prem_srch'),
(23, 'Travel Ultrasound Technologist - Adult Echocardiography $2880/wk', 'The Job Network', 'travel, health, account, direct, help, digital, patient', 'https://www.linkedin.com/jobs/view/3906249515/?trk=jobs_biz_prem_srch'),
(24, 'Traffic Clerk', 'DHL Supply Chain', 'service, facility, records, accurate, manner, customer, company', 'https://www.linkedin.com/jobs/view/3906249517/?trk=jobs_biz_prem_srch'),
(25, 'Salesperson', 'Advance Auto Parts', 'store, employee, basic, performing, sales, knowledge, job', 'https://www.linkedin.com/jobs/view/3906249519/?trk=jobs_biz_prem_srch'),
(26, 'Applied Scientist I', 'IntePros', 'learning, individuals, technical, experience, professional, health, hr', 'https://www.linkedin.com/jobs/view/3906249524/?trk=jobs_biz_prem_srch'),
(27, 'Diesel Mechanic- Forestry Field Technician - Sign-on Bonus Available!', 'Titan Machinery', 'paid, insurance, account, leave, safety, equipment, provided', 'https://www.linkedin.com/jobs/view/3906249530/?trk=jobs_biz_prem_srch'),
(28, 'Data Analyst', 'orangepeople', 'data, project, reporting, management, technical, training, issues', 'https://www.linkedin.com/jobs/view/3906249532/?trk=jobs_biz_prem_srch'),
(29, 'Salesperson', 'Advance Auto Parts', 'store, employee, basic, performing, sales, knowledge, job', 'https://www.linkedin.com/jobs/view/3906249534/?trk=jobs_biz_prem_srch'),
(30, 'Endoscopy Technician - PRN (47860)', 'United Digestive', 'patient, patients, procedures, duties, include, nurse, nursing', 'https://www.linkedin.com/jobs/view/3906249537/?trk=jobs_biz_prem_srch'),
(31, 'Talent Management and Development Coordinator', 'DHL Supply Chain', 'talent, training, management, development, organization, continuous, materials', 'https://www.linkedin.com/jobs/view/3906249538/?trk=jobs_biz_prem_srch'),
(32, 'Controller', 'Saildrone Inc', 'accounting, annual, reporting, data, finance, financial, support', 'https://www.linkedin.com/jobs/view/3906249540/?trk=jobs_biz_prem_srch'),
(33, 'Sales Representative - Electrical', 'Graybar', 'business, plan, sales, right, believe, employee, employees', 'https://www.linkedin.com/jobs/view/3906249545/?trk=jobs_biz_prem_srch'),
(34, 'Sales Representative - Government Strategic Accounts', 'Graybar', 'sales, plan, right, believe, employee, grow, employees', 'https://www.linkedin.com/jobs/view/3906249546/?trk=jobs_biz_prem_srch'),
(35, 'Data Science/Visualization Intern (Summer 2024)', 'Clarios', 'diversity, people, changes, track, employees, require, market', 'https://www.linkedin.com/jobs/view/3906249573/?trk=jobs_biz_prem_srch'),
(36, 'Payroll Manager', 'Nordson Corporation', 'finance, business, global, employees, management, manage, continuous', 'https://www.linkedin.com/jobs/view/3906249574/?trk=jobs_biz_prem_srch'),
(37, 'Tax Senior Manager, Passthrough Tax', 'Frazier & Deeter', 'accounting, professionals, clients, providing, practice, growing, review', 'https://www.linkedin.com/jobs/view/3906249575/?trk=jobs_biz_prem_srch'),
(38, 'Tax Senior Manager, Corporate Tax', 'Frazier & Deeter', 'accounting, professionals, clients, corporate, providing, practice, growing', 'https://www.linkedin.com/jobs/view/3906249576/?trk=jobs_biz_prem_srch'),
(39, 'Telework Option - Hybrid - Underwriting Representative II', 'California Department of Housing & Community Development', 'application, documents, state, qualifications, required, job, apply', 'https://www.linkedin.com/jobs/view/3906249577/?trk=jobs_biz_prem_srch'),
(40, 'Senior Tax Manager', 'Frazier & Deeter', 'accounting, planning, clients, professionals, senior, serve, services', 'https://www.linkedin.com/jobs/view/3906249578/?trk=jobs_biz_prem_srch'),
(41, 'Senior Associate, Corporate Tax', 'Frazier & Deeter', 'accounting, clients, corporate, professionals, individual, help, providing', 'https://www.linkedin.com/jobs/view/3906249580/?trk=jobs_biz_prem_srch'),
(42, 'Retail Stocking Supervisor', 'Harbor Freight Tools', 'associates, holidays, leadership, year, able, paid, retail', 'https://www.linkedin.com/jobs/view/3906249585/?trk=jobs_biz_prem_srch'),
(43, 'Server Administrator II - Global Studio', 'Gensler', 'cloud, security, design, client, understanding, programs, systems', 'https://www.linkedin.com/jobs/view/3906249596/?trk=jobs_biz_prem_srch'),
(44, 'Manufacturing Plant Manager', 'Confidential', 'manufacturing, production, operational, management, financial, continuous, excellence', 'https://www.linkedin.com/jobs/view/3906249604/?trk=jobs_biz_prem_srch'),
(45, 'ETL Developer - Remote', 'Compunnel Inc.', 'develop, ability, remote, youll, compliance, tools, experience', 'https://www.linkedin.com/jobs/view/3906249607/?trk=jobs_biz_prem_srch'),
(46, 'Mental Health Therapist (Contractor)', 'Spring Health', 'care, health, mental, clinical, open, provide, youll', 'https://www.linkedin.com/jobs/view/3906249610/?trk=jobs_biz_prem_srch'),
(47, 'Sr HR Business Partner - Sacramento County, California (Remote)', 'Prime Therapeutics', 'hr, human, resources, business, director, vision, required', 'https://www.linkedin.com/jobs/view/3906249614/?trk=jobs_biz_prem_srch'),
(48, 'Associate Creative Director', 'Cognizant', 'digital, design, clients, lead, companies, business, commercial', 'https://www.linkedin.com/jobs/view/3906249621/?trk=jobs_biz_prem_srch'),
(49, 'Cobol with SQL, Pl/SQL Developer with Energy/ Utility background', 'Cognizant', 'business, processes, skills, strong, clients, documentation, requirements', 'https://www.linkedin.com/jobs/view/3906249622/?trk=jobs_biz_prem_srch'),
(50, 'Contract Administrator', 'Navajo Transitional Energy Company, LLC', 'contract, employee, required, abilities, office, job, vision', 'https://www.linkedin.com/jobs/view/3297645846/?trk=jobs_biz_prem_srch'),
(51, 'Project Manager', 'McInnis Engineering', 'project, projects, clients, engineering, professional, successful, candidate', 'https://www.linkedin.com/jobs/view/3299509053/?trk=jobs_biz_prem_srch'),
(52, 'Director of Communications and Digital Diplomacy', 'Consulate General of Israel to New England', 'digital, public, communications, social, ability, director, network', 'https://www.linkedin.com/jobs/view/3308438674/?trk=jobs_biz_prem_srch'),
(53, 'Director, Investment Sales', 'Kenai Capital Advisors', 'commercial, market, clients, industry, comprehensive, sales, team', 'https://www.linkedin.com/jobs/view/3322949022/?trk=jobs_biz_prem_srch'),
(54, 'Sanitation Supervisor', 'White Bottle Inc.', 'food, manufacturing, job, safety, perform, policies, able', 'https://www.linkedin.com/jobs/view/3363439517/?trk=jobs_biz_prem_srch'),
(55, 'Trial Attorney', 'McDonnell & Associates, P.C.', 'commercial, associates, clients, team, working, legal, strategy', 'https://www.linkedin.com/jobs/view/3364366864/?trk=jobs_biz_prem_srch'),
(56, 'Anaplan Developer', 'Webologix Ltd/ INC', 'planning, implementation, skills, management, excel, ability, strong', 'https://www.linkedin.com/jobs/view/3366698309/?trk=jobs_biz_prem_srch'),
(57, 'Senior Account Manager', 'Garven Design Group', 'retail, objectives, account, customer, sales, key, accounts', 'https://www.linkedin.com/jobs/view/3377655935/?trk=jobs_biz_prem_srch'),
(58, 'Finishing Editor', 'Nebraska Public Media', 'technical, production, software, equipment, local, public, remote', 'https://www.linkedin.com/jobs/view/3379554375/?trk=jobs_biz_prem_srch'),
(59, 'Account Executive - Mid-Market', 'Crisp', 'successful, sales, account, customers, great, grow, success', 'https://www.linkedin.com/jobs/view/3383214611/?trk=jobs_biz_prem_srch'),
(60, 'Motion Graphic Designer and Film Editor', 'Elica Electric Co', 'design, electrical, production, creating, engineering, role, products', 'https://www.linkedin.com/jobs/view/3407282046/?trk=jobs_biz_prem_srch'),
(61, 'Social Media Manager and Graphic Designer', 'Century Trucks & Vans', 'social, marketing, accounts, manager, best, strategies, managing', 'https://www.linkedin.com/jobs/view/3422171886/?trk=jobs_biz_prem_srch'),
(62, 'Licensed Mental Health Counselor/ Licensed Clinical Social Worker', 'Tree of Life Counseling Center', 'growing, staff, clients, office, locations, group, fulltime', 'https://www.linkedin.com/jobs/view/3426467577/?trk=jobs_biz_prem_srch'),
(63, 'Client Service Representative', 'Marquee Event Rentals', 'client, account, director, inventory, order, local, positions', 'https://www.linkedin.com/jobs/view/3431736996/?trk=jobs_biz_prem_srch'),
(64, 'Legal Assistant / Paralegal', 'Testa Heck Testa & White, P.A.', 'legal, general, clients, local, services, assistant, personnel', 'https://www.linkedin.com/jobs/view/3438939828/?trk=jobs_biz_prem_srch'),
(65, 'Accounting Specialist', 'Health & Rehab Solutions', 'accounting, good, company, assist, software, information, learn', 'https://www.linkedin.com/jobs/view/3438976411/?trk=jobs_biz_prem_srch'),
(66, 'Client Relationship Specialist', 'Ameriflex', 'client, clients, business, use, person, account, experience', 'https://www.linkedin.com/jobs/view/3447180215/?trk=jobs_biz_prem_srch'),
(67, 'Clinical Trainee / Pre-Liscneded Therapist', 'Fraser', 'clinical, client, day, cost, practice, track, mental', 'https://www.linkedin.com/jobs/view/3458210342/?trk=jobs_biz_prem_srch'),
(68, 'Owner', 'Landscape Management Group', 'project, management, managers, group, construction, role, commercial', 'https://www.linkedin.com/jobs/view/3466187886/?trk=jobs_biz_prem_srch'),
(69, 'Tax Associate', 'Karuna Advisors', 'clients, daily, tasks, multiple, members, work, team', 'https://www.linkedin.com/jobs/view/3475821770/?trk=jobs_biz_prem_srch'),
(70, 'Senior Developer', 'USLI', 'individual, team, technologies, development, systems, new, complex', 'https://www.linkedin.com/jobs/view/3475933396/?trk=jobs_biz_prem_srch'),
(71, 'Energy and Asset Coordinator', 'Moseley Architects', 'energy, design, facility, project, projects, data, management', 'https://www.linkedin.com/jobs/view/3478606637/?trk=jobs_biz_prem_srch'),
(72, 'Photonics Layout Intern', 'Axalume', 'improvement, data, center, deliver, additional, technology, cloud', 'https://www.linkedin.com/jobs/view/3478651125/?trk=jobs_biz_prem_srch'),
(73, 'Summer Intern for Women International Company', 'Women choice', 'leadership, programs, gender, applications, program, events, digital', 'https://www.linkedin.com/jobs/view/3480552482/?trk=jobs_biz_prem_srch'),
(74, 'Social Media Marketing Specialist Internship', 'SEH Excavating, Inc.', 'social, marketing, site, construction, team, employees, communications', 'https://www.linkedin.com/jobs/view/3483544074/?trk=jobs_biz_prem_srch'),
(75, 'Chief Executive Officer', 'ZM Jobs & Hiring Limited', 'strategic, business, regulatory, company, accounting, events, risk', 'https://www.linkedin.com/jobs/view/3486250934/?trk=jobs_biz_prem_srch'),
(76, 'Leasing & Property Management Specialist (Part-Time with Growth Potential)', 'Foley Development', 'fulltime, management, grow, status, positive, role, company', 'https://www.linkedin.com/jobs/view/3487703305/?trk=jobs_biz_prem_srch'),
(77, 'Group Fitness Instructor', 'Burn Boot Camp', 'group, training, community, personal, providing, customer, service', 'https://www.linkedin.com/jobs/view/3492110889/?trk=jobs_biz_prem_srch'),
(78, 'Commercial Litigation Associate Attorney', 'LHH', 'commercial, associate, complex, legal, required, position, track', 'https://www.linkedin.com/jobs/view/3499072207/?trk=jobs_biz_prem_srch'),
(79, 'Assistant Director', 'Kiddie Academies of Greater Seattle Careers', 'director, assistant, right, leader, group, care, center', 'https://www.linkedin.com/jobs/view/3511440340/?trk=jobs_biz_prem_srch'),
(80, 'Marketing Manager', 'CITY Boots', 'marketing, brand, external, digital, industry, social, email', 'https://www.linkedin.com/jobs/view/3514667133/?trk=jobs_biz_prem_srch'),
(81, 'Associate Brand Manager', 'AVAVA', 'brand, sales, marketing, customer, job, description, associate', 'https://www.linkedin.com/jobs/view/3514683108/?trk=jobs_biz_prem_srch'),
(82, 'Customer Success Manager', 'Conduit Tech', 'customer, success, home, critical, impact, energy, customers', 'https://www.linkedin.com/jobs/view/3515274431/?trk=jobs_biz_prem_srch'),
(83, 'Grants Writer - Subcontract', 'Grant Writing Solutions', 'contract, role, research, independently, clients, excellent, working', 'https://www.linkedin.com/jobs/view/3520238337/?trk=jobs_biz_prem_srch'),
(84, 'Retail Salesperson', 'LaBella Intimates & Boutique', 'retail, store, social, marketing, clients, hours, sales', 'https://www.linkedin.com/jobs/view/3527189387/?trk=jobs_biz_prem_srch'),
(85, 'Administrator of College & Career Development', 'Education Success Foundation', 'program, development, relevant, career, community, continuous, programs', 'https://www.linkedin.com/jobs/view/3530975184/?trk=jobs_biz_prem_srch'),
(86, 'Eastern Regional Sales Coordinator', 'SDi Fire', 'sales, job, product, existing, customers, email, follow', 'https://www.linkedin.com/jobs/view/3531344675/?trk=jobs_biz_prem_srch'),
(87, 'Java architect / Lead Java developer', 'NLB Services', 'lead, onsite, type, require, fulltime, engineering, manager', 'https://www.linkedin.com/jobs/view/3533320307/?trk=jobs_biz_prem_srch'),
(88, 'Field Operations Specialist', 'DIGS Vacation Rentals.com', 'operations, field, management, skills, role, communication, problem', 'https://www.linkedin.com/jobs/view/3537193915/?trk=jobs_biz_prem_srch'),
(89, 'Enterprise Data & Analytics Infrastructure Manager', 'KeyBank', 'data, drive, program, talent, security, highly, lead', 'https://www.linkedin.com/jobs/view/3540371917/?trk=jobs_biz_prem_srch'),
(90, 'Heating Air Conditioning Technician', 'Flo-Rite Mechanical, LLC', 'maintenance, responsible, electrical, role, commercial, onsite, performing', 'https://www.linkedin.com/jobs/view/3544166785/?trk=jobs_biz_prem_srch'),
(91, 'Brand Representative', 'Polyram Plastic Industries Ltd', 'engineering, sales, industry, background, commitment, new, strong', 'https://www.linkedin.com/jobs/view/3547664337/?trk=jobs_biz_prem_srch'),
(92, 'Mental Health Therapist', 'Clarity Counseling Pittsburgh', 'practice, flexible, hiring, state, positions, contract, hire', 'https://www.linkedin.com/jobs/view/3548616699/?trk=jobs_biz_prem_srch'),
(93, 'Inbound Call Center Specialist', 'TECHEAD', 'customers, customer, candidates, employment, contract, week, onsite', 'https://www.linkedin.com/jobs/view/3550388220/?trk=jobs_biz_prem_srch'),
(94, 'Community Program Assistant', 'Miracles for Kids', 'programs, community, basic, support, events, team, lives', 'https://www.linkedin.com/jobs/view/3551631423/?trk=jobs_biz_prem_srch'),
(95, 'User Experience Designer', 'Starup Insurance', 'design, research, insurance, experience, role, contract, remote', 'https://www.linkedin.com/jobs/view/3555161614/?trk=jobs_biz_prem_srch'),
(96, 'CT Technologist', 'Erlanger', 'department, patients, procedures, employee, andor, appropriate, hospital', 'https://www.linkedin.com/jobs/view/3566954493/?trk=jobs_biz_prem_srch'),
(97, 'Administrative Assistant Bookkeeper', 'Throttle Company Vintage Motorcycles', 'assistant, time, office, hr, retail, required, home', 'https://www.linkedin.com/jobs/view/3574102287/?trk=jobs_biz_prem_srch'),
(98, 'Swahili Instructor', 'Beat the Streets - Baltimore', 'contract, implement, learning, creating, age, education, gender', 'https://www.linkedin.com/jobs/view/3578562287/?trk=jobs_biz_prem_srch'),
(99, 'Elementary School Teacher', 'LANE PUBLIC SCHOOL', 'public, excellence, base, certification, seeking, school, pay', 'https://www.linkedin.com/jobs/view/3580530332/?trk=jobs_biz_prem_srch'),
(100, 'Industrial Business Development Manager', 'Action Equipment and Scaffold Company', 'business, development, company, equipment, manager, new, role', 'https://www.linkedin.com/jobs/view/3580545157/?trk=jobs_biz_prem_srch'),
(101, 'Private Fitness Instructor', 'The Line Method', 'clients, training, personal, creating, certification, create, learn', 'https://www.linkedin.com/jobs/view/3581219846/?trk=jobs_biz_prem_srch'),
(102, 'Accounts Analyst', 'McNaughton Bros. Inc.', 'accounts, finance, providing, customer, service, accounting, role', 'https://www.linkedin.com/jobs/view/3582587683/?trk=jobs_biz_prem_srch'),
(103, 'Sales and Application Engineer', 'Böning Ship Automation USA', 'sales, engineer, commercial, technical, electrical, area, new', 'https://www.linkedin.com/jobs/view/3583960568/?trk=jobs_biz_prem_srch'),
(104, 'Senior Software Engineer', 'StyleAI', 'marketing, team, product, core, engineering, technical, role', 'https://www.linkedin.com/jobs/view/3586167732/?trk=jobs_biz_prem_srch'),
(105, 'Drone-Car Engineer', 'Lorenz Motors', 'engineer, engineering, travel, software, technology, systems, related', 'https://www.linkedin.com/jobs/view/3592392532/?trk=jobs_biz_prem_srch'),
(106, '2L 2025 Summer Law Clerk', 'Shute, Mihaly & Weinberger LLP', 'practice, law, applications, energy, legal, public, values', 'https://www.linkedin.com/jobs/view/3592869068/?trk=jobs_biz_prem_srch'),
(107, 'Marketing Manager', 'Balltime', 'marketing, social, manager, market, candidate, lead, brand', 'https://www.linkedin.com/jobs/view/3594311833/?trk=jobs_biz_prem_srch'),
(108, 'Scientific Project Manager for Food, Beverage, and Consumer Packaged Goods Industries (Project Architect | PA)', 'PreScouter, Inc.', 'project, food, needs, clients, remote, delivering, able', 'https://www.linkedin.com/jobs/view/3594710940/?trk=jobs_biz_prem_srch'),
(109, 'Maintenance Manager', 'MEC (Mayville Engineering Company, Inc.)', 'maintenance, electrical, equipment, projects, safety, facility, contract', 'https://www.linkedin.com/jobs/view/3599918756/?trk=jobs_biz_prem_srch'),
(110, 'Primary Care Leader Needed', 'Health Alliance Solutions', 'healthcare, care, primary, patient, leadership, providing, role', 'https://www.linkedin.com/jobs/view/3606129051/?trk=jobs_biz_prem_srch'),
(111, 'Child Custody Recommending Counselor', 'Superior Court of California, County of El Dorado', 'insurance, employees, program, subject, fulltime, family, year', 'https://www.linkedin.com/jobs/view/3606634863/?trk=jobs_biz_prem_srch'),
(112, 'Field Director', 'Mi Familia Vota', 'field, director, training, regular, limited, drive, reports', 'https://www.linkedin.com/jobs/view/3609090859/?trk=jobs_biz_prem_srch'),
(113, 'Sales Development Representative', 'HirelyAI', 'sales, marketing, potential, process, opportunities, market, results', 'https://www.linkedin.com/jobs/view/3610032286/?trk=jobs_biz_prem_srch'),
(114, 'Ophthalmic Technician', 'Mountain View Eye Center', 'practice, clinical, patients, include, medical, advanced, requires', 'https://www.linkedin.com/jobs/view/3610591138/?trk=jobs_biz_prem_srch'),
(115, 'Tool and Die Maker', 'Prolink', 'production, design, tools, education, materials, order, diploma', 'https://www.linkedin.com/jobs/view/3614817348/?trk=jobs_biz_prem_srch'),
(116, 'Senior Mechanical Engineer', 'Dexterity, Inc.', 'engineering, design, systems, help, test, including, base', 'https://www.linkedin.com/jobs/view/3619548798/?trk=jobs_biz_prem_srch'),
(117, 'DDI Engineer', 'Xoriant', 'security, engineer, solutions, technology, services, tasks, ensure', 'https://www.linkedin.com/jobs/view/3625991523/?trk=jobs_biz_prem_srch'),
(118, 'Mechanical Design Engineer', 'Mestek Machinery', 'engineering, test, required, individual, projects, performing, vision', 'https://www.linkedin.com/jobs/view/3626110567/?trk=jobs_biz_prem_srch'),
(119, 'Quality Engineer', 'Staff Management | SMX', 'action, production, range, pay, quality, candidates, changes', 'https://www.linkedin.com/jobs/view/3627141928/?trk=jobs_biz_prem_srch'),
(120, '🌟🚀🌊 Make Waves with Your Sales Skills! Earn $2500-$3500/Week! 🌊🚀🌟', 'Maranatha Consulting', 'week, sales, making, right, success, year, need', 'https://www.linkedin.com/jobs/view/3629278196/?trk=jobs_biz_prem_srch'),
(121, 'Associate Attorney', 'Reed Leeper, P.C.', 'candidates, construction, experience, commercial, addition, area, general', 'https://www.linkedin.com/jobs/view/3635014033/?trk=jobs_biz_prem_srch'),
(122, 'Montessori teacher for grades K-3', 'Bennett Academy', 'works, established, primary, seeking, leadership, school, apply', 'https://www.linkedin.com/jobs/view/3635117665/?trk=jobs_biz_prem_srch'),
(123, 'Medical Consultant', 'Veritas Physician Management', 'resources, tools, management, professionals, practice, network, collaboration', 'https://www.linkedin.com/jobs/view/3635916819/?trk=jobs_biz_prem_srch'),
(124, 'Skilled Painter for Fabrication Shop', 'Endeco Fabrication, LLC', 'understanding, control, variety, project, safety, equipment, procedures', 'https://www.linkedin.com/jobs/view/3636873993/?trk=jobs_biz_prem_srch'),
(125, 'URGENT!! Influencer Marketing Intern (100% WFH)', 'Acadium', 'marketing, digital, projects, community, need, director, help', 'https://www.linkedin.com/jobs/view/3638272617/?trk=jobs_biz_prem_srch'),
(126, 'Blender Animator (Contract)', 'Groove Jones', 'person, candidate, contract, companies, knowledge, applications, general', 'https://www.linkedin.com/jobs/view/3639866700/?trk=jobs_biz_prem_srch'),
(127, 'Experienced Growth Consultants with OD/OCM experience', 'AirTight Management', 'management, growth, companies, teams, managing, sales, leadership', 'https://www.linkedin.com/jobs/view/3644730777/?trk=jobs_biz_prem_srch'),
(128, 'Project Assistant', 'SICIS', 'project, assistant, projects, organizational, salary, multiple, management', 'https://www.linkedin.com/jobs/view/3649948789/?trk=jobs_biz_prem_srch'),
(129, 'Director of Finance', 'Society of St. Vincent de Paul Detroit', 'finance, accounting, risk, management, financial, director, contract', 'https://www.linkedin.com/jobs/view/3651735073/?trk=jobs_biz_prem_srch'),
(130, 'Car Salesperson', 'Smith Imports LLC', 'sales, service, existing, customer, excellent, customers, skills', 'https://www.linkedin.com/jobs/view/3651779099/?trk=jobs_biz_prem_srch'),
(131, 'MEP Engineer', 'Citrine LLC', 'projects, electrical, company, engineering, andor, project, building', 'https://www.linkedin.com/jobs/view/3658924039/?trk=jobs_biz_prem_srch'),
(132, 'School Counselor', 'Bishop Ludden Junior-Senior High School', 'school, program, implement, world, community, career, strong', 'https://www.linkedin.com/jobs/view/3659406780/?trk=jobs_biz_prem_srch'),
(133, 'Client Success Manager (Locums Tenens)', 'Cynet Locums', 'client, strong, customer, email, healthcare, current, compliance', 'https://www.linkedin.com/jobs/view/3660449148/?trk=jobs_biz_prem_srch'),
(134, 'Receptionist', 'Abgin Law, PC', 'legal, law, clients, personal, client, individuals, team', 'https://www.linkedin.com/jobs/view/3662420217/?trk=jobs_biz_prem_srch'),
(135, 'Accounts Payable Specialist', 'Soyventis North America LLC', 'maintain, accounts, communicate, contact, role, functions, company', 'https://www.linkedin.com/jobs/view/3663813835/?trk=jobs_biz_prem_srch'),
(136, 'Senior Electronics Design Engineer', 'Excelon Solutions', 'electrical, engineering, design, development, test, power, science', 'https://www.linkedin.com/jobs/view/3666781416/?trk=jobs_biz_prem_srch'),
(137, 'Level 1 Designer', 'Insight Apparel', 'design, professional, development, brand, level, social, production', 'https://www.linkedin.com/jobs/view/3678077169/?trk=jobs_biz_prem_srch'),
(138, 'Special Event Manager', 'Experience Columbia SC', 'events, client, needed, clients, director, management, onsite', 'https://www.linkedin.com/jobs/view/3679026145/?trk=jobs_biz_prem_srch'),
(139, 'Quality Assurance Specialist', 'Ascendion', 'insurance, engineering, quality, experiences, paid, change, culture', 'https://www.linkedin.com/jobs/view/3681437990/?trk=jobs_biz_prem_srch'),
(140, 'Attending Physician', 'Universal Health Corporation', 'care, patients, best, facility, support, clinical, time', 'https://www.linkedin.com/jobs/view/3682650399/?trk=jobs_biz_prem_srch'),
(141, 'Pediatric Occupational Therapy', 'Saylor Physical Therapy', 'patients, care, facility, practice, license, clients, help', 'https://www.linkedin.com/jobs/view/3684991720/?trk=jobs_biz_prem_srch'),
(142, 'Sales Director - Part-Time - Remote', 'Despard Analytics', 'existing, clients, network, client, create, work, new', 'https://www.linkedin.com/jobs/view/3687125020/?trk=jobs_biz_prem_srch'),
(143, 'Request for Consultancy: Interim Managing Director', 'Q Center', 'community, future, director, contract, center, managing, change', 'https://www.linkedin.com/jobs/view/3690117793/?trk=jobs_biz_prem_srch'),
(144, 'Board Member', 'Ripple Effect Artists ', 'member, mission, company, social, strategic, role, power', 'https://www.linkedin.com/jobs/view/3691624158/?trk=jobs_biz_prem_srch'),
(145, 'Team Lead', 'ASICS Corporation', 'able, sales, job, employees, general, essential, functions', 'https://www.linkedin.com/jobs/view/3691793998/?trk=jobs_biz_prem_srch'),
(146, 'Senior Retail Sales Associate', 'Ruff House Print Shop', 'retail, store, seeking, day, working, orders, weekly', 'https://www.linkedin.com/jobs/view/3692329268/?trk=jobs_biz_prem_srch'),
(147, 'Interior Designer', 'DSGN Associates', 'design, projects, community, good, construction, work, quality', 'https://www.linkedin.com/jobs/view/3693083161/?trk=jobs_biz_prem_srch'),
(148, 'FIELD SALES REPRESENTATIVE - North Carolina', 'Willie\'s Superbrew', 'sales, accounts, market, focus, business, execution, account', 'https://www.linkedin.com/jobs/view/3693886408/?trk=jobs_biz_prem_srch'),
(149, 'Admin/HR/Customer Support', 'A&B Machine and Design, Inc.', 'sales, employee, support, customers, person, including, assist', 'https://www.linkedin.com/jobs/view/3694149664/?trk=jobs_biz_prem_srch');

-- --------------------------------------------------------

--
-- Table structure for table `planner`
--

CREATE TABLE `planner` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_title` varchar(255) NOT NULL,
  `course_url` varchar(255) NOT NULL,
  `skill` varchar(100) NOT NULL,
  `status` enum('in_progress','completed') DEFAULT 'in_progress',
  `added_date` date DEFAULT curdate(),
  `completed_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `planner`
--

INSERT INTO `planner` (`id`, `user_id`, `course_title`, `course_url`, `skill`, `status`, `added_date`, `completed_date`) VALUES
(1, 5, 'Project Risk Management', 'https://www.coursera.org/learn/project-risk-management-', '', 'completed', '2025-04-03', '2025-04-03'),
(2, 5, 'Introduction to Thermodynamics: Transferring Energy from Here to There', 'https://www.coursera.org/learn/thermodynamics-intro', '', 'completed', '2025-04-03', '2025-04-03'),
(3, 5, 'Operations and Patient Safety for Healthcare IT Staff', 'https://www.coursera.org/learn/healthcare-it-operations-patient-safety', '', 'completed', '2025-04-03', '2025-04-19'),
(4, 5, 'Low Intermediate English: Help & Information', 'https://www.coursera.org/learn/low-intermediate-help-information', '', 'in_progress', '2025-04-19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `skills` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `skills`) VALUES
(5, 'amv', 'amv@gmail.com', '$2y$10$/XF89xA1g8O2pyDorjN3eu6JlBc91P2L0Y24np4178FjDWpqj5jcO', ', lead, design, program');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `planner`
--
ALTER TABLE `planner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `planner`
--
ALTER TABLE `planner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `planner`
--
ALTER TABLE `planner`
  ADD CONSTRAINT `planner_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
