package com.khbiz.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khbiz.attendmanage.AttendListDTO;
import com.khbiz.attendmanage.AttendManageService;
import com.khbiz.schedule.ScheduleDTO;
import com.khbiz.schedule.ScheduleService;

@Controller
@RequestMapping(value="/s_json")
@ResponseBody
public class ScheduleJsonController {
	@Inject
	private ScheduleService scheduleService;
	@Inject
	private AttendManageService AttendManageService;
	
	@RequestMapping(value="/getSchedule")
	public ResponseEntity<List<ScheduleDTO>> getList(String code){
		List<ScheduleDTO> list = scheduleService.getScheduleList(code);
		return new ResponseEntity<List<ScheduleDTO>>(list, HttpStatus.OK);
	}
	@RequestMapping(value="/setschedule", method=RequestMethod.POST)
	public ResponseEntity<List<ScheduleDTO>> setSchedule(ScheduleDTO scheduleDTO){
		scheduleService.setSchedule(scheduleDTO);
		
		return this.getList(scheduleDTO.getCode());
	}
	
	@RequestMapping(value="/getAttend")
	public ResponseEntity<AttendListDTO> getAttend(String code){
		AttendListDTO attend = AttendManageService.getAttend(code);
		return new ResponseEntity<AttendListDTO>(attend,HttpStatus.OK);
	}
	

}
