=-- Users
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(150),
  role VARCHAR(20), -- admin, donor, recipient, analyst
  verified BOOLEAN DEFAULT false
);

-- Donations
CREATE TABLE donations (
  donation_id SERIAL PRIMARY KEY,
  donor_id INT REFERENCES users(user_id),
  food_type VARCHAR(100),
  quantity INT,
  unit VARCHAR(20),
  expiry TIMESTAMP,
  status VARCHAR(20) DEFAULT 'available', -- available, claimed, completed
  created_at TIMESTAMP DEFAULT NOW()
);

-- Claims
CREATE TABLE claims (
  claim_id SERIAL PRIMARY KEY,
  donation_id INT REFERENCES donations(donation_id),
  recipient_id INT REFERENCES users(user_id),
  status VARCHAR(20) DEFAULT 'pending', -- pending, approved, delivered
  claimed_at TIMESTAMP
);

-- Reports (for analyst)
CREATE TABLE reports (
  report_id SERIAL PRIMARY KEY,
  generated_by INT REFERENCES users(user_id),
  report_type VARCHAR(50),
  generated_at TIMESTAMP DEFAULT NOW(),
  file_link TEXT
);
