<?php 
	/**
	 * summary
	 */
	class Loaitin
	{
	    /**
	     * summary
	     */
	    private $idLoaiTin;
	    private $idTheLoai;
	    private $tenLoaiTin;
	    private $tenLoaiTinKhongDau;
	    private $thuTu;
	    private $anHien;
	    public function __construct($idLoaiTin,$idTheLoai,$tenLoaiTin,$tenLoaiTinKhongDau,$thuTu,$anHien)
	    {
	        $this->idLoaiTin = $idLoaiTin;
	        $this->idTheLoai = $idTheLoai;
	        $this->tenLoaiTin = $tenLoaiTin;
	        $this->tenLoaiTinKhongDau = $tenLoaiTinKhongDau;
	        $this->thuTu = $thuTu;
	        $this->anHien = $anHien;
	    }
	
    /**
     * @return mixed
     */
    public function getIdLoaiTin()
    {
        return $this->idLoaiTin;
    }

    /**
     * @param mixed $idLoaiTin
     *
     * @return self
     */
    public function setIdLoaiTin($idLoaiTin)
    {
        $this->idLoaiTin = $idLoaiTin;

        return $this;
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
    public function getTenLoaiTin()
    {
        return $this->tenLoaiTin;
    }

    /**
     * @param mixed $tenLoaiTin
     *
     * @return self
     */
    public function setTenLoaiTin($tenLoaiTin)
    {
        $this->tenLoaiTin = $tenLoaiTin;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getTenLoaiTinKhongDau()
    {
        return $this->tenLoaiTinKhongDau;
    }

    /**
     * @param mixed $tenLoaiTinKhongDau
     *
     * @return self
     */
    public function setTenLoaiTinKhongDau($tenLoaiTinKhongDau)
    {
        $this->tenLoaiTinKhongDau = $tenLoaiTinKhongDau;

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