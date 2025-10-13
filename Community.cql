// Load Step 1 - Nodes
//
CREATE (n:Software {id:"six"});
CREATE (n:Software {id:"pandas"}); 
CREATE (n:Software {id:"numpy"}); 
CREATE (n:Software {id:"python-dateutil"}); 
CREATE (n:Software {id:"pytz"}); 
CREATE (n:Software {id:"pyspark"}); 
CREATE (n:Software {id:"matplotlib"}); 
CREATE (n:Software {id:"spacy"}); 
CREATE (n:Software {id:"py4j"}); 
CREATE (n:Software {id:"jupyter"}); 
CREATE (n:Software {id:"jpy-console"}); 
CREATE (n:Software {id:"nbconvert"}); 
CREATE (n:Software {id:"ipykernel"}); 
CREATE (n:Software {id:"jpy-client"}); 
CREATE (n:Software {id:"jpy-core"}); 
//
// Load Step 2 - Relationships
//
MATCH (a:Software {id:"pandas"}), (b:Software {id:"numpy"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"pandas"}), (b:Software {id:"pytz"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"pandas"}), (b:Software {id:"python-dateutil"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"python-dateutil"}), (b:Software {id:"six"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"pyspark"}), (b:Software {id:"py4j"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"matplotlib"}), (b:Software {id:"numpy"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"matplotlib"}), (b:Software {id:"python-dateutil"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"matplotlib"}), (b:Software {id:"six"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"matplotlib"}), (b:Software {id:"pytz"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"spacy"}), (b:Software {id:"six"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"spacy"}), (b:Software {id:"numpy"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"jupyter"}), (b:Software {id:"nbconvert"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"jupyter"}), (b:Software {id:"ipykernel"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"jupyter"}), (b:Software {id:"jpy-console"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"jpy-console"}), (b:Software {id:"jpy-client"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"jpy-console"}), (b:Software {id:"ipykernel"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"jpy-client"}), (b:Software {id:"jpy-core"}) MERGE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Software {id:"nbconvert"}), (b:Software {id:"jpy-core"}) MERGE (a)-[:DEPENDS_ON]->(b);
// return nodes
MATCH (n)
RETURN n;

