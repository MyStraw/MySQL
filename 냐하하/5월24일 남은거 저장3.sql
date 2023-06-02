CREATE TABLE member (
  id varchar(10) NOT NULL,
  pass varchar(10) NOT NULL,
  name varchar(30) NOT NULL,
  regidate timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (id)
)
