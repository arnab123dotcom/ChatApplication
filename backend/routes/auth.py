from fastapi import Depends, HTTPException, APIRouter
from fastapi.responses import RedirectResponse
from schemas import UserSignIn, UserSignUp
from database_connection.database_tables import User
from sqlalchemy.orm import Session
from database_connection.db_conn import get_db
import json
from sqlalchemy import desc

router = APIRouter()

@router.post("/signup", status_code=201)
def userSignUp(currentUser: UserSignUp, dataBase: Session=Depends(get_db)):
    userFromDb = dataBase.query(User).filter(User.user_email == currentUser.email).first()

    if userFromDb:
        raise HTTPException(400, "You already Signed Up!")
    
    last_filled_row = dataBase.query(User).order_by(desc(User.user_id)).first()

    if last_filled_row == None:
        userId = 0
    else:
        userId = last_filled_row.user_id + 1
    
    newUser = User(user_id = userId, user_name = currentUser.username, user_email = currentUser.email, user_password = currentUser.password)

    dataBase.add(newUser)
    dataBase.commit()
    dataBase.refresh(newUser)

    return newUser

@router.post("/signin")
def userSignIn(currentUser: UserSignIn, dataBase: Session=Depends(get_db)):
    userFromDb = dataBase.query(User).filter(User.user_email == currentUser.email).first()

    if not userFromDb:
        raise HTTPException(400, "Sign Up First!")
    
    if userFromDb.user_password != currentUser.password:
        raise HTTPException(400, "Incorrect Password!!")
    
    return {"message": "Sign in Successful", "email": userFromDb.user_email}
        
