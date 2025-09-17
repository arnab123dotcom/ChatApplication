from pydantic import BaseModel

class UserSignUp(BaseModel):
    username: str
    password: str
    email: str

class UserSignIn(BaseModel):
    email: str
    password: str