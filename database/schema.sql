-- Copyright 2026 上海如静知华信息科技有限公司 · https://www.zhuatech.cn/
CREATE DATABASE IF NOT EXISTS zhuatech_competitorai DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE zhuatech_competitorai;

CREATE TABLE competitor_intelligence (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  subject VARCHAR(240) NOT NULL,
  scenario VARCHAR(240) NOT NULL,
  context_text TEXT NULL,
  risk_level VARCHAR(48) NOT NULL DEFAULT 'PENDING',
  review_status VARCHAR(48) NOT NULL DEFAULT 'PENDING',
  confidence_score DECIMAL(5,2) NULL,
  created_by BIGINT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_competitorai_status (review_status, created_at)
);

CREATE TABLE competitorai_analysis_task (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  business_id BIGINT NOT NULL,
  provider_code VARCHAR(64) NOT NULL DEFAULT 'local',
  model_code VARCHAR(128) NULL,
  request_snapshot JSON NULL,
  result_snapshot JSON NULL,
  execution_mode VARCHAR(48) NOT NULL DEFAULT 'LOCAL_DEMO_PIPELINE',
  task_status VARCHAR(48) NOT NULL DEFAULT 'PENDING',
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_competitorai_task (business_id, task_status)
);

CREATE TABLE competitorai_audit_log (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  business_id BIGINT NOT NULL,
  action_code VARCHAR(80) NOT NULL,
  operator_id BIGINT NULL,
  detail_json JSON NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_competitorai_audit (business_id, created_at)
);
