from fastapi import FastAPI
from routes import auth, chat
from database_connection import db_conn
from database_connection.base_declaration import Base
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

app.include_router(auth.router, prefix="/auth")
app.include_router(chat.router)

Base.metadata.create_all(db_conn.engine)