/* Copyright 2026 上海如静知华信息科技有限公司 · https://www.zhuatech.cn/ */
package cn.zhuatech.competitorai.controller;

import cn.zhuatech.competitorai.service.WorkspaceService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/competitorai")
@CrossOrigin(originPatterns = {"http://localhost:*", "http://127.0.0.1:*"})
public class WorkspaceController {
    private final WorkspaceService service;

    public WorkspaceController(WorkspaceService service) { this.service = service; }

    @GetMapping("/health")
    public Map<String, String> health() { return Map.of("status", "UP", "project", "zhuatech-competitorai"); }

    @PostMapping("/run")
    public WorkspaceService.RunResult run(@Valid @RequestBody WorkspaceService.RunRequest request) {
        return service.run(request);
    }
}
