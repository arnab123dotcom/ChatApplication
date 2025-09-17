from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

database_url = "postgresql://postgres:root@localhost:5432/user_info"

engine = create_engine(database_url)
sessionLocal = sessionmaker(autoflush=False, autocommit=False, bind=engine)

def get_db():
    db = sessionLocal()
    try:
        yield db
    finally:
        db.close()