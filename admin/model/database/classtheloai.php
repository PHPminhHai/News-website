<?php 
	/**
	 * summary
	 */
	class Theloai
	{
	    /**
	     * summary
	     */
	    private $idTheLoai;
	    private $tenTheLoai;
	    private $tenTheLoaiKhongDau;
	    private $thuTu;
	    private $anHien;
	    public function __construct($idTheLoai,$tenTheLoai,$tenTheLoaiKhongDau,$thuTu,$anHien)
	    {
	        $this->idTheLoai = $idTheLoai;
	        $this->tenTheLoai = $tenTheLoai;
	        $this->tenTheLoaiKhongDau = $tenTheLoaiKhongDau;
	        $this->thuTu = $thuTu;
	        $this->anHien = $anHien;
	    }
	
    /**
     * @return mixed
     */
    public function getIdTheLoai()
    {
        return $this->idTheLoai;
    }

    /**
     * @param mixed $idTheLoai
     *
     * @return self
     */
    public function setIdTheLoai($idTheLoai)
    {
        $this->idTheLoai = $idTheLoai;

        return $this;
    }
    
    /**
     * @return mixed
     */
    public function getTenTheLoai()
    {
        return $this->tenTheLoai;
    }

    /**
     * @param mixed $tenTheLoai
     *
     * @return self
     */
    public function setTenTheLoai($tenTheLoai)
    {
        $this->tenTheLoai = $tenTheLoai;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getTenTheLoaiKhongDau()
    {
        return $this->tenTheLoaiKhongDau;
    }

    /**
     * @param mixed $tenTheLoaiKhongDau
     *
     * @return self
     */
    public function setTenTheLoaiKhongDau($tenTheLoaiKhongDau)
    {
        $this->tenTheLoaiKhongDau = $tenTheLoaiKhongDau;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getThuTu()
    {
        return $this->thuTu;
    }

    /**
     * @param mixed $thuTu
     *
     * @return self
     */
    public function setThuTu($thuTu)
    {
        $this->thuTu = $thuTu;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getAnHien()
    {
        return $this->anHien;
    }

    /**
     * @param mixed $anHien
     *
     * @return self
     */
    public function setAnHien($anHien)
    {
        $this->anHien = $anHien;

        return $this;
    }
}
?>