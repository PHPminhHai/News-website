<?php 
class User{
	private $idUser;
	private $fullName;
	private $gender;
	private $birthDay;
	private $userName;
	private $passWord;
	private $userEmail;
	private $userPhone;
	private $userAddress;
	private $userAdmin;
	public function __construct($idUser,$fullName,$gender,$birthDay,$userName,$passWord,$userEmail,$userPhone,$userAddress,$userAdmin){
		$this->idUser =$idUser;
		$this->fullName =$fullName;
		$this->gender =$gender;
		$this->birthDay =$birthDay;
		$this->userName =$userName;
		$this->passWord =$passWord;
		$this->userEmail =$userEmail;
		$this->userPhone =$userPhone;
		$this->userAddress =$userAddress;
		$this->userAdmin =$userAdmin;
	}

	
 
    /**
     * @return mixed
     */
    public function getIdUser()
    {
        return $this->idUser;
    }

    /**
     * @param mixed $idUser
     *
     * @return self
     */
    public function setIdUser($idUser)
    {
        $this->idUser = $idUser;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getFullName()
    {
        return $this->fullName;
    }

    /**
     * @param mixed $fullName
     *
     * @return self
     */
    public function setFullName($fullName)
    {
        $this->fullName = $fullName;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getGender()
    {
        return $this->gender;
    }

    /**
     * @param mixed $gender
     *
     * @return self
     */
    public function setGender($gender)
    {
        $this->gender = $gender;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getBirthDay()
    {
        return $this->birthDay;
    }

    /**
     * @param mixed $birthDay
     *
     * @return self
     */
    public function setBirthDay($birthDay)
    {
        $this->birthDay = $birthDay;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getUserName()
    {
        return $this->userName;
    }

    /**
     * @param mixed $userName
     *
     * @return self
     */
    public function setUserName($userName)
    {
        $this->userName = $userName;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getPassWord()
    {
        return $this->passWord;
    }

    /**
     * @param mixed $passWord
     *
     * @return self
     */
    public function setPassWord($passWord)
    {
        $this->passWord = $passWord;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getUserEmail()
    {
        return $this->userEmail;
    }

    /**
     * @param mixed $userEmail
     *
     * @return self
     */
    public function setUserEmail($userEmail)
    {
        $this->userEmail = $userEmail;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getUserPhone()
    {
        return $this->userPhone;
    }

    /**
     * @param mixed $userPhone
     *
     * @return self
     */
    public function setUserPhone($userPhone)
    {
        $this->userPhone = $userPhone;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getUserAddress()
    {
        return $this->userAddress;
    }

    /**
     * @param mixed $userAddress
     *
     * @return self
     */
    public function setUserAddress($userAddress)
    {
        $this->userAddress = $userAddress;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getUserAdmin()
    {
        return $this->userAdmin;
    }

    /**
     * @param mixed $userAdmin
     *
     * @return self
     */
    public function setUserAdmin($userAdmin)
    {
        $this->userAdmin = $userAdmin;

        return $this;
    }
}

 ?>